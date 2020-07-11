import 'package:flutter/material.dart';
import 'package:project_pi/screens/HomePage/home_page.dart';
import 'inputform_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'SignUpPage';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String nama;
  String email;
  String password;
  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 28.0,
                      ),
                    ),
                    InputForm(
                      hint: 'Full Name',
                      hidetext: false,
                      onChanged: (value) {
                        nama = value;
                      },
                    ),
                    InputForm(
                      hint: 'Email Address',
                      hidetext: false,
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    InputForm(
                      hint: 'Phone Number',
                      hidetext: false,
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                    ),
                    InputForm(
                      hint: 'Password',
                      hidetext: true,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    InputForm(
                      hint: 'Confirm Password',
                      hidetext: true,
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      height: 45.0,
                      width: 270.0,
                      child: RaisedButton(
                        child: Text('SIGN UP'),
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);

                            _firestore.collection('UserAccount').add({
                              'Email Address': email,
                              'Full Name': nama,
                              'Phone Number': phoneNumber,
                            });
                            if (newUser != null) {
                              Navigator.pushNamed(context, HomePage.id);
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('Have an Account?'),
                    SizedBox(
                      height: 7.5,
                    ),
                    InkWell(
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onTap: () {
                        AlertDialog(
                          title: Text("Finish?"),
                          content: Text("Are you sure with the data?"),
                          actions: <Widget>[
                            FlatButton(onPressed: null, child: null)
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
