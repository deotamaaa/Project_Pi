import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:project_pi/screens/HomePage/home_page.dart';

class ConfirmationOrder extends StatefulWidget {
  static const String id = 'ConfirmationOrder';
  final String addressText,
      addNotes,
      groomingType,
      catSize,
      catBreeds,
      addOnServices;
  final String selectedDate;
  final String selectedTime;

  ConfirmationOrder({
    this.addressText,
    this.addNotes,
    this.catSize,
    this.addOnServices,
    this.catBreeds,
    this.groomingType,
    this.selectedDate,
    this.selectedTime,
    String value,
    FirebaseUser firebaseUser,
  });
  @override
  _ConfirmationOrderState createState() => _ConfirmationOrderState();
}

class _ConfirmationOrderState extends State<ConfirmationOrder> {
  String userId;
  final _firestore = Firestore.instance;
  bool showSpinner = false;

  getCurrentUser() async {
    FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    setState(() {
      userId = firebaseUser.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(25.0, 68.0, 70.0, 26.0),
                  child: Text(
                    'Confirmation Order',
                    style: TextStyle(fontSize: 35.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(26.0, 25.0, 26.0, 20.0),
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                  height: 450.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 3.0),
                        blurRadius: 2.5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ConfirmationText(
                          confirmText:
                              'Grooming Type : ' + widget.groomingType),
                      ConfirmationText(
                          confirmText: 'Cat Breeds : ' + widget.catBreeds),
                      ConfirmationText(
                          confirmText: 'Cat Size :' + widget.catSize),
                      ConfirmationText(
                          confirmText:
                              'Add - On Services : ' + widget.addOnServices),
                      ConfirmationText(
                          confirmText:
                              'Reservation Date : ' + widget.selectedDate),
                      ConfirmationText(
                          confirmText:
                              'Reservation Time: ' + widget.selectedTime),
                      ConfirmationText(
                          confirmText:
                              'Pick Up Address : ' + widget.addressText),
                      ConfirmationText(
                          confirmText: 'Additional Notes : ' + widget.addNotes),
                    ],
                  ),
                ),
                Text('Please make sure all the data above already correct.'),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: 150.0,
                  height: 40.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      'BOOK NOW',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final reservationData =
                            await _firestore.collection('UserAccount').add({
                          'uid': userId,
                          'Cat Brreds': widget.catBreeds,
                          'Grooming Type': widget.groomingType,
                          'Cat Size': widget.catSize,
                          'AddOn': widget.addOnServices,
                          'Reservation Date': widget.selectedDate,
                          'Reservation Time': widget.selectedTime,
                          'Add Notes': widget.addNotes,
                        });
                        if (reservationData != null) {
                          Navigator.pushNamed(context, HomePage.id);
                        }
                        setState(() {
                          showSpinner = true;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmationText extends StatelessWidget {
  ConfirmationText({this.confirmText});
  final String confirmText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        confirmText,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}
