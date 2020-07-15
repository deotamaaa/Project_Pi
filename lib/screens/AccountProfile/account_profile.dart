import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_pi/screens/LoginPage/HalamanLogin.dart';

class AccountProfile extends StatefulWidget {
  static const String id = "AccountProfile";
  @override
  _AccountProfileState createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  DocumentSnapshot data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(25.0, 68.0, 25.0, 47.0),
                width: 500.0,
                child: Text(
                  'Account Profile',
                  style: TextStyle(fontSize: 35.0),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                height: 100.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3, 5),
                      color: Colors.grey,
                    )
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.0),
                      width: 80.0,
                      child: Image(
                        image: AssetImage('assets/images/Cat_Head@4x.png'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Email'),
                            Text('Email@email.com'),
                            Text('+02112345678'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                width: 325.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: MaterialButton(
                  child: Text('SIGN OUT'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 6,
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, HalamanLogin.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
