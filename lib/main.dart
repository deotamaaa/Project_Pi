import 'package:flutter/material.dart';
import 'package:project_pi/screens/AccountProfile/account_profile.dart';
import 'package:project_pi/screens/HomePage/home_page.dart';
import 'package:project_pi/screens/LiveMaps/live_maps.dart';
import 'package:project_pi/screens/LoginPage/HalamanLogin.dart';
import 'package:project_pi/screens/ReservationHistory/history_page.dart';
import 'package:project_pi/screens/ReservationPage/confirmationorder.dart';
import 'package:project_pi/screens/ReservationPage/information_detail.dart';
import 'package:project_pi/screens/SignUpPage/halaman_signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HalamanLogin.id,
      routes: {
        HalamanLogin.id: (context) => HalamanLogin(),
        SignUpPage.id: (context) => SignUpPage(),
        HomePage.id: (context) => HomePage(),
        InformationDetail.id: (context) => InformationDetail(),
        ConfirmationOrder.id: (context) => ConfirmationOrder(),
        HistoryPage.id: (context) => HistoryPage(),
        LiveMaps.id: (context) => LiveMaps(),
        AccountProfile.id: (context) => AccountProfile(),
      },
    );
  }
}
