class PlantModel {
  final int id;
  final String name;
  final String recTemp;
  final String recHum;
  final String recSoil;

  PlantModel({
    required this.id,
    required this.name,
    required this.recTemp,
    required this.recHum,
    required this.recSoil,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      id: json['id'],
      name: json['name'],
      recTemp: json['recTemp'],
      recHum: json['recHum'],
      recSoil: json['recSoil'],
    );
  }
}
