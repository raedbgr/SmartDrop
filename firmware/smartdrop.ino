#include <WiFi.h>
#include <Firebase_ESP_Client.h>
#include <DHT.h>
#include <ArduinoJson.h>
#include <addons/TokenHelper.h>
#include <addons/RTDBHelper.h>

// WiFi credentials
const char* WIFI_SSID = "YOUR_SSID";
const char* WIFI_PASSWORD = "YOUR_PASS";

// Firebase project settings
#define API_KEY "YOUR_API_KEY"
#define DATABASE_URL "YOUR_DB_URL"

// Firebase Auth
#define USER_EMAIL "YOUR_CREDS"
#define USER_PASSWORD "YOUR_CREDS"

// Define Firebase Data object
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

// Define sensor pins
#define DHT_PIN 4          // GPIO for DHT temperature/humidity sensor
#define SOIL_MOISTURE_PIN 34  // Soil moisture sensor analog input
#define WATER_LEVEL_PIN 35    // Water level sensor analog input
#define FLOW_SENSOR_PIN 18    // Water flow sensor input (YF-S401)
#define RELAY_PIN 26          // Relay for pump control
#define ALARM_PIN 27          // LED/Buzzer for water level alarm

// DHT sensor setup (supports both DHT11 and DHT22)
#define DHTTYPE DHT22       // Change to DHT11 if using that sensor
DHT dht(DHT_PIN, DHTTYPE);

// Flow sensor variables
volatile int pulse_count = 0;
float flow_rate = 0.0;
float total_liters = 0.0;
unsigned long last_flow_calc = 0;

// Irrigation threshold values
const int HUMIDITY_THRESHOLD = 40;  // Start irrigation below this soil moisture %
const int HUMIDITY_STOP = 70;       // Stop irrigation above this soil moisture %

// Water level threshold values
const int WATER_LOW_THRESHOLD = 300;   // Low water level warning threshold
const int WATER_HIGH_THRESHOLD = 900;  // Normal water level threshold

// Timing variables
unsigned long last_sensor_reading = 0;
unsigned long last_firebase_update = 0;
const long SENSOR_INTERVAL = 5000;    // Read sensors every 5 seconds
const long FIREBASE_INTERVAL = 10000;  // Update Firebase every 10 seconds

// Status variables
bool irrigation_status = false;
bool alarm_status = false;
bool firebase_ready = false;

// Function prototypes
void setup_wifi();
void setup_firebase();
void IRAM_ATTR count_pulse();
float read_temperature();
float read_humidity();
int read_soil_moisture();
int read_water_level();
void check_irrigation();
void check_water_level();
void update_firebase();

void setup() {
  Serial.begin(115200);
  delay(100);
  
  // Initialize pins
  pinMode(SOIL_MOISTURE_PIN, INPUT);
  pinMode(WATER_LEVEL_PIN, INPUT);
  pinMode(FLOW_SENSOR_PIN, INPUT_PULLUP);
  pinMode(RELAY_PIN, OUTPUT);
  pinMode(ALARM_PIN, OUTPUT);
  
  // Initial states
  digitalWrite(RELAY_PIN, LOW);  // Pump off
  digitalWrite(ALARM_PIN, LOW);  // Alarm off
  
  // Start sensors
  dht.begin();
  
  // Attach interrupt for flow sensor
  attachInterrupt(digitalPinToInterrupt(FLOW_SENSOR_PIN), count_pulse, RISING);
  
  // Connect to WiFi
  setup_wifi();
  
  // Initialize Firebase
  setup_firebase();
  
  Serial.println("Setup complete!");
}

void loop() {
  unsigned long current_time = millis();
  
  // Process flow sensor data every second
  if (current_time - last_flow_calc >= 1000) {
    // Temporarily detach interrupt to perform calculations
    detachInterrupt(digitalPinToInterrupt(FLOW_SENSOR_PIN));
    
    // Convert pulses to flow rate (L/min)
    flow_rate = (pulse_count / 7.5);  // YF-S401: 7.5 pulses = 1 L/min
    total_liters += (flow_rate / 60.0);  // Add to total volume
    
    Serial.print("Débit d'eau: ");
    Serial.print(flow_rate);
    Serial.print(" L/min | Volume total: ");
    Serial.print(total_liters);
    Serial.println(" L");
    
    // Reset pulse counter and update time
    pulse_count = 0;
    last_flow_calc = current_time;
    
    // Re-attach interrupt
    attachInterrupt(digitalPinToInterrupt(FLOW_SENSOR_PIN), count_pulse, RISING);
  }
  
  // Read sensors every SENSOR_INTERVAL milliseconds
  if (current_time - last_sensor_reading >= SENSOR_INTERVAL) {
    // Read all sensor values
    float temperature = read_temperature();
    float humidity = read_humidity();
    int soil_moisture = read_soil_moisture();
    int water_level = read_water_level();
    
    // Check if irrigation should be turned on/off
    check_irrigation();
    
    // Check water level and control alarm
    check_water_level();
    
    last_sensor_reading = current_time;
  }
  
  // Update Firebase every FIREBASE_INTERVAL milliseconds
  if (firebase_ready && current_time - last_firebase_update >= FIREBASE_INTERVAL) {
    update_firebase();
    last_firebase_update = current_time;
  }
  
  // Maintain Firebase connection
  // if (firebase_ready) {
  //   Firebase.RTDB.loop();
  // }
}

// Flow sensor interrupt handler
void IRAM_ATTR count_pulse() {
  pulse_count++;
}

// Setup WiFi connection
void setup_wifi() {
  Serial.print("Connecting to WiFi: ");
  Serial.println(WIFI_SSID);
  
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  
  Serial.println();
  Serial.println("WiFi connected!");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

// Setup Firebase connection
void setup_firebase() {
  Serial.println("Setting up Firebase...");
  
  // Assign API key and RTDB URL
  config.api_key = API_KEY;
  config.database_url = DATABASE_URL;

  // Assign authentication credentials
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;
  
  // Initialize Firebase
  Firebase.begin(&config, &auth);
  
  // Set database read timeout to 1 minute
  Firebase.RTDB.setReadTimeout(&fbdo, 1000 * 60);
  
  // Set reconnect and retry count
  Firebase.reconnectWiFi(true);
  
  Serial.println("Firebase setup completed");
  firebase_ready = true;
}

// Read temperature from DHT sensor
float read_temperature() {
  float temperature = dht.readTemperature();
  
  if (isnan(temperature)) {
    Serial.println("Failed to read temperature from DHT sensor!");
    return 0.0;
  }
  
  Serial.print("Temperature: ");
  Serial.print(temperature);
  Serial.println(" °C");
  
  return temperature;
}

// Read humidity from DHT sensor
float read_humidity() {
  float humidity = dht.readHumidity();
  
  if (isnan(humidity)) {
    Serial.println("Failed to read humidity from DHT sensor!");
    return 0.0;
  }
  
  Serial.print("Humidity: ");
  Serial.print(humidity);
  Serial.println(" %");
  
  return humidity;
}

// Read soil moisture as percentage
int read_soil_moisture() {
  int raw_value = analogRead(SOIL_MOISTURE_PIN);
  int moisture = map(raw_value, 3095, 0, 0, 100);  // Convert to percentage (ESP32 ADC)
  
  Serial.print("Soil moisture: ");
  Serial.print(moisture);
  Serial.println(" %");
  
  return moisture;
}

// Read water level
int read_water_level() {
  int water_level = analogRead(WATER_LEVEL_PIN);
  
  Serial.print("Water level: ");
  Serial.print(water_level);
  Serial.println(" (0-4095)");
  
  return water_level;
}

// Check if irrigation should be turned on/off
void check_irrigation() {
  int soil_moisture = read_soil_moisture();
  
  if (soil_moisture < HUMIDITY_THRESHOLD && !irrigation_status) {
    Serial.println("Starting irrigation!");
    digitalWrite(RELAY_PIN, HIGH);  // Turn on pump
    irrigation_status = true;
  } 
  else if (soil_moisture > HUMIDITY_STOP && irrigation_status) {
    Serial.println("Stopping irrigation!");
    digitalWrite(RELAY_PIN, LOW);  // Turn off pump
    irrigation_status = false;
  }
}

// Check water level and control alarm
void check_water_level() {
  int water_level = read_water_level();
  
  if (water_level < WATER_LOW_THRESHOLD && !alarm_status) {
    Serial.println("⚠ Low water level! Activating alarm.");
    digitalWrite(ALARM_PIN, HIGH);  // Turn on alarm
    alarm_status = true;
  } 
  else if (water_level > WATER_HIGH_THRESHOLD && alarm_status) {
    Serial.println("✅ Normal water level. Deactivating alarm.");
    digitalWrite(ALARM_PIN, LOW);  // Turn off alarm
    alarm_status = false;
  }
}

// Update data to Firebase
void update_firebase() {
    if (!firebase_ready) return;
  
    Serial.println("Updating data to Firebase...");
  
    // Read sensor values once
    float temperature = read_temperature();
    float humidity = read_humidity();
    int soil_moisture = read_soil_moisture();
    int water_level = read_water_level();
  
    // Create JSON document for all sensor data
    FirebaseJson json;
    json.set("temperature", temperature);
    json.set("humidity", humidity);
    json.set("soil_moisture", soil_moisture);
    json.set("water_level", water_level);
    json.set("flow_rate", flow_rate);
    json.set("total_liters", total_liters);
    json.set("irrigation_status", irrigation_status);
    json.set("alarm_status", alarm_status);
  
    // Send data to Firebase
    if (Firebase.RTDB.setJSON(&fbdo, "/sensor_data", &json)) {
      Serial.println("Firebase updated successfully!");
    } else {
      Serial.print("Firebase update failed: ");
      Serial.println(fbdo.errorReason());
    }
}
