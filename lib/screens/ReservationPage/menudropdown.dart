import 'package:flutter/material.dart';

typedef onChangeCallback = void Function(dynamic);

class MenuDropDown extends StatefulWidget {
  final String dropdownText;
  final String type;
  final onChangeCallback onChanged;
  MenuDropDown({this.dropdownText, this.type, this.onChanged});
  @override
  _MenuDropDownState createState() => _MenuDropDownState();
}

class _MenuDropDownState extends State<MenuDropDown> {
  String selectedItem;
  List<String> dropdownItems = [];

  List<String> groomingTypeList = ['Basic Grooming', 'Full Grooming'];

  List<String> catBreedsList = [
    'Persia',
    'Anggora',
    'Domestic',
    'Maine Coon',
    'Russian Blue',
    'Slamese',
    'Munchkin',
    'Ragdoll',
    'Scottish Fold',
  ];

  List<String> catSizeList = [
    'Small Size',
    'Medium Size',
    'Large Size',
    'Extra Large Size',
  ];

  List<String> addOnServicesList = [
    'Spa & Massage',
    'Shaving Hair / Styling',
    'Injection Vitamis Skin & Coat',
    'Cleaning Pet House and Environment',
    'Fur Tangled Treatment',
  ];

  List<String> getListBasedOnName(String value) {
    print(value);
    switch (value) {
      case "groomingType":
        return groomingTypeList;

        break;
      case "catBreeds":
        return catBreedsList;
        break;

      case "catSize":
        return catSizeList;
        break;
      case "addOnServices":
        return addOnServicesList;
        break;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    print(widget.type);

    dropdownItems = getListBasedOnName(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 10.0),
      child: Container(
        width: 325.0,
        height: 50.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(2.5, 5.5),
              blurRadius: 5.0,
            )
          ],
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              value: selectedItem,
              hint: Padding(
                padding: const EdgeInsets.fromLTRB(22.0, 0, 0, 0),
                child: Text(
                  widget.dropdownText,
                  style: TextStyle(),
                ),
              ),
              items: dropdownItems.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedItem = value;
                });
                widget.onChanged(value);
              }),
        ),
      ),
    );
  }
}
