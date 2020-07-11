import 'package:flutter/material.dart';
import 'package:project_pi/screens/ReservationPage/menudropdown.dart';
import 'TitleName.dart';

class InformationDetail extends StatefulWidget {
  static const String id = 'InformationDetail';
  @override
  _InformationDetailState createState() => _InformationDetailState();
}

class _InformationDetailState extends State<InformationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(25.0, 68.0, 70.0, 26.0),
                child: Text(
                  'Information Detail',
                  style: TextStyle(fontSize: 35.0),
                ),
              ),
              Column(
                // Wrap Column
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      TitleName(
                        titleText: 'Grooming Type',
                        infoIcon: Icons.info,
                      ),
                      MenuDropDown(
                        dropdownText: 'Grooming Type...',
                        type: "groomingType",
                      ),
                      TitleName(
                        titleText: 'Cat Breeds',
                      ),
                      MenuDropDown(
                        dropdownText: 'Cat Breeds...',
                        type: "catBreeds",
                      ),
                      TitleName(
                        titleText: 'Cat Size',
                        infoIcon: Icons.info,
                      ),
                      MenuDropDown(
                        dropdownText: 'Cat Size...',
                        type: "catSize",
                      ),
                      TitleName(
                        titleText: 'Add-On Services',
                      ),
                      MenuDropDown(
                        dropdownText: 'Add - On Services...',
                        type: "addOnServices",
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                        width: 75.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/ReservationDetail');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
