import '/imports.dart';

class MySearchBar extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmittedFunction;

  MySearchBar({required this.controller, required this.onSubmittedFunction});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  final PlantsController plantsCtrl = Get.find();
  late bool hasText = false;

  @override
  Widget build(BuildContext context) {
    String ctrlText = widget.controller.text;
    if (ctrlText != '') {
      hasText = true;
    }
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff242529)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff242529)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: hasText ? IconButton(
          icon: const Icon(Icons.clear_rounded),
          onPressed: () {
            setState(() {
              widget.controller.clear();
              hasText = false;
              plantsCtrl.updateSearchList('');
            });
          },
        ) : null,
        hintText: 'Search',
        filled: true,
        fillColor: const Color(0xfffdfefe),
      ),
      onSubmitted: widget.onSubmittedFunction,
    );
  }
}
