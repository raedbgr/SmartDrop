import '/imports.dart';

class PlantsController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<PlantModel> searchList = <PlantModel>[].obs;
  String searchPlantText = '';
  final List<PlantModel> plants = [
    PlantModel(id: 1, name: 'karmousa', recTemp: '20-25°C', recHum: '40-50%', recSoil: 'Moist'),
    PlantModel(id: 2, name: '3enba', recTemp: '25-30°C', recHum: '50-60%', recSoil: 'Moist'),
    PlantModel(id: 3, name: 'batata', recTemp: '30-35°C', recHum: '60-70%', recSoil: 'Moist'),
    PlantModel(id: 4, name: 'felfel', recTemp: '20-25°C', recHum: '40-50%', recSoil: 'Moist'),
    PlantModel(id: 5, name: 'tmatem', recTemp: '25-30°C', recHum: '50-60%', recSoil: 'Moist'),
    PlantModel(id: 6, name: 'ma3dnous', recTemp: '30-35°C', recHum: '60-70%', recSoil: 'Moist'),
    PlantModel(id: 7, name: 'plant 1', recTemp: '20-25°C', recHum: '40-50%', recSoil: 'Moist'),
  ];

  void updateSearchList(String searchText) {
    searchList.assignAll(plants.where((element) =>
        element.name.toLowerCase().contains(searchText.toLowerCase())).toList());
  }
}