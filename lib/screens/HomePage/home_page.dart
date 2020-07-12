import 'package:flutter/material.dart';
import 'package:project_pi/screens/HomePage/homebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_pi/screens/ReservationHistory/history_page.dart';
import 'package:project_pi/screens/ReservationPage/information_detail.dart';

class HomePage extends StatefulWidget {
  static const String id = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(25.0, 68.0, 256.0, 47.0),
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 35.0),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    HomeNavButton(
                      prefixIcon: Icons.date_range,
                      textbutton: 'Make Reservation',
                      onPressed: () {
                        Navigator.pushNamed(context, InformationDetail.id);
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    HomeNavButton(
                      prefixIcon: Icons.list,
                      textbutton: 'Reservation History',
                      onPressed: () {
                        Navigator.pushNamed(context, HistoryPage.id);
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    HomeNavButton(
                      prefixIcon: Icons.person,
                      textbutton: 'Account Profile',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
