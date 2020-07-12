import 'package:flutter/material.dart';
import 'package:project_pi/screens/ReservationPage/confirmationorder.dart';
import 'package:project_pi/screens/ReservationPage/menudropdown.dart';
import 'TitleName.dart';
import 'dart:async';

class InformationDetail extends StatefulWidget {
  static const String id = 'InformationDetail';
  @override
  _InformationDetailState createState() => _InformationDetailState();
}

class _InformationDetailState extends State<InformationDetail> {
  String addressText, addNotes, groomingType, catSize, catBreeds, addOnServices;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Container(
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
                          onChanged: (value) {
                            groomingType = value;
                          },
                        ),
                        TitleName(
                          titleText: 'Cat Breeds',
                        ),
                        MenuDropDown(
                          dropdownText: 'Cat Breeds...',
                          type: "catBreeds",
                          onChanged: (value) {
                            catBreeds = value;
                          },
                        ),
                        TitleName(
                          titleText: 'Cat Size',
                          infoIcon: Icons.info,
                        ),
                        MenuDropDown(
                          dropdownText: 'Cat Size...',
                          type: "catSize",
                          onChanged: (value) {
                            catSize = value;
                          },
                        ),
                        TitleName(
                          titleText: 'Add-On Services',
                        ),
                        MenuDropDown(
                          dropdownText: 'Add - On Services...',
                          type: "addOnServices",
                          onChanged: (value) {
                            addOnServices = value;
                          },
                        ),
                        TitleName(
                          titleText: 'Reservation Date',
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 130,
                              height: 30,
                              margin: EdgeInsets.fromLTRB(50.0, 0, 62, 0),
                              child: RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 6,
                                child: Text(
                                  'Choose Date',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                            ),
                            Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ],
                        ),
                        TitleName(
                          titleText: 'Reservation Time',
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 130,
                              height: 30,
                              margin: EdgeInsets.fromLTRB(50.0, 0, 62, 0),
                              decoration: BoxDecoration(),
                              child: RaisedButton(
                                color: Colors.white,
                                child: Text(
                                  'Choose Time',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 6,
                                onPressed: () => _selectTime(context),
                              ),
                            ),
                            Text("${selectedTime.toString()}".split(' ')[0]),
                          ],
                        ),
                        TitleName(
                          titleText: 'Pick Up Address',
                        ),
                        Container(
                          width: 320,
                          height: 40,
                          child: TextFormField(
                            maxLines: null,
                            minLines: null,
                            expands: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(35.0, 10.0, 0, 10.0),
                              hintText: 'Address Here...',
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onChanged: (value) {
                              addressText = value;
                            },
                          ),
                        ),
                        TitleName(
                          titleText: 'Additional Notes',
                          infoIcon: Icons.info,
                        ),
                        Container(
                          width: 320,
                          child: TextFormField(
                            maxLines: 4,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(35.0, 10.0, 0, 10.0),
                              hintText: 'E.g. ',
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onChanged: (value) {
                              addNotes = value;
                            },
                          ),
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ConfirmationOrder(
                                          catSize: catSize,
                                          groomingType: groomingType,
                                          catBreeds: catBreeds,
                                          addOnServices: addOnServices,
                                          selectedDate: selectedDate
                                              .toString()
                                              .split(' ')[0],
                                          selectedTime: selectedTime.toString(),
                                          addressText: addressText,
                                          addNotes: addNotes,
                                        )));
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
