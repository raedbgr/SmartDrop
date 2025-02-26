import 'package:cloud_firestore/cloud_firestore.dart';
import '/imports.dart';

class PlantsController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<PlantModel> searchList = <PlantModel>[].obs;
  String searchPlantText = '';
  final List<PlantModel> plants = [
    PlantModel(id: 1, name: 'Aloe Vera', recTemp: '20-25°C', recHum: '40-50%', recSoil: 'Normal'),
    PlantModel(id: 2, name: 'Lavender', recTemp: '25-30°C', recHum: '50-60%', recSoil: 'Moist'),
    PlantModel(id: 3, name: 'Rose', recTemp: '30-35°C', recHum: '60-70%', recSoil: 'Normal'),
    PlantModel(id: 4, name: 'Tulip', recTemp: '20-25°C', recHum: '40-50%', recSoil: 'Dry'),
    PlantModel(id: 5, name: 'Orchid', recTemp: '25-30°C', recHum: '50-60%', recSoil: 'Moist'),
    PlantModel(id: 6, name: 'Sunflower', recTemp: '30-35°C', recHum: '60-70%', recSoil: 'Normal'),
    PlantModel(id: 7, name: 'Cactus', recTemp: '40-50°C', recHum: '40-50%', recSoil: 'Dry'),
    PlantModel(id: 8, name: 'Basil', recTemp: '20-25°C', recHum: '40-50%', recSoil: 'Moist'),
    PlantModel(id: 8, name: 'Mint', recTemp: '20-25°C', recHum: '40-50%', recSoil: 'Normal'),
    PlantModel(id: 9, name: 'Jasmine', recTemp: '20-25°C', recHum: '40-50%', recSoil: 'Moist'),
  ];

  void updateSearchList(String searchText) {
    searchList.assignAll(plants.where((element) =>
        element.name.toLowerCase().contains(searchText.toLowerCase())).toList());
  }

  Future<void> uploadPlantsToFirestore() async {
    try {
      // Reference to Firestore collection
      CollectionReference plantsCollection = _firestore.collection('plants');

      // Uploading each plant to Firestore
      for (var plant in plants) {
        await plantsCollection.doc(plant.id.toString()).set({
          'name': plant.name,
          'recTemp': plant.recTemp,
          'recHum': plant.recHum,
          'recSoil': plant.recSoil,
        });
      }
      print('Plants uploaded successfully');
    } catch (e) {
      print('Error uploading plants: $e');
    }
  }
}
