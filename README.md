# Smart Drop - IoT Irrigation and Plant Care System

Smart Drop is an IoT-based irrigation and plant care system designed to optimize water consumption while ensuring ideal conditions for plant growth. It monitors environmental factors in RealTime and provides insightful data visualization to help users maintain healthy plants efficiently.

## Features

### 🌱 Plant Monitoring & Irrigation Optimization

- Temperature & Humidity Detection: Monitors environmental conditions in real-time.

- Soil Moisture Detection: Ensures soil maintains optimal moisture levels.

- Water Flow Rate Monitoring: Tracks the amount of water being used.

- Water Level Detection: Monitors the water tank level to prevent dry runs.

### 📊 Data Visualization

- Bar Chart for Water Consumption: Displays daily water usage.

- Line Chart for Temperature & Humidity Trends: Shows environmental changes over time.

### 🌿 Plant Database & Recommendations

- Plant List Page: A catalog of plants with specific environmental requirements.

- Plant Details Popup: Tapping on a plant shows recommended temperature, humidity, and soil moisture levels.

### 🔧 Hardware Components

- Soil moisture sensor

- Temperature and humidity sensor (DHT11)

- Water flow sensor (YF-S401)

- Water level sensor (CAP-028)

- Microcontroller (ESP32-WROOM-32D)

- Irrigation Kit

### 💻 Software & Tools Used

- Embedded Programming: Arduino IDE

- Frontend: Flutter 

- Database: Firebase

### 🚀 Getting Started

1️⃣ Clone the Repository

```
  git clone https://github.com/raedbgr/SmartDrop.git
  cd smart-drop
```

2️⃣ Install Dependencies

For Arduino:

Install required libraries in Arduino IDE
The Arduino `.ino` file can be found [here](firmware/SmartDrop.ino).

For Flutter:

```
  flutter pub get
```

3️⃣ Upload Code to Microcontroller

Use the Arduino IDE or PlatformIO to flash the code onto your ESP32.

4️⃣ Run the Application

```
  flutter run
```
