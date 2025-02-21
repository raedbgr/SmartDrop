import '/imports.dart';

class PlantsPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const PlantsPage({required this.scaffoldKey, super.key});

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  final PlantsController plantsCtrl = Get.find();

  @override
  void initState() {
    super.initState();
    plantsCtrl.updateSearchList('');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12.5, 15, 12.5, 15),
          child: MySearchBar(
            controller: plantsCtrl.searchController,
            onSubmittedFunction: (covariant) {
              setState(() {
                plantsCtrl.searchPlantText = covariant;
                plantsCtrl.updateSearchList(plantsCtrl.searchPlantText);
              });
            },
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
            () => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: plantsCtrl.searchList.length,
              itemBuilder: (BuildContext context, int index) {
                final plant = plantsCtrl.searchList[index];
                return GestureDetector(
                  onTap: () {
                    // when i tap a dialog appears with the plant's details
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: const Color(0xff242529),
                          title: Text(
                            plant.name,
                            style: const TextStyle(
                              color: Color(0xfffdfefe),
                              fontSize: 26,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          content: ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              spacing: 10,
                              children: [
                                Text('Recommended Temperature: ${plant.recTemp}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xfffdfefe),
                                      fontWeight: FontWeight.w300,
                                    )),
                                Text('Recommended Humidity: ${plant.recHum}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xfffdfefe),
                                      fontWeight: FontWeight.w300,
                                    )),
                                Text(
                                  'Recommended Soil Moisture: ${plant.recSoil}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xfffdfefe),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                  'Close',
                                  style: TextStyle(
                                    color: Color(0xff2dbd5a),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: MyCard(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 20,
                    children: [
                      const Icon(
                        Icons.grass_rounded,
                        color: Color(0xff2dbd5a),
                        size: 40,
                      ),
                      Text(
                        plant.name,
                        style: const TextStyle(
                          color: Color(0xfffdfefe),
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )),
                );
              },
            ),
          ),
        )),
      ],
    );
  }
}
