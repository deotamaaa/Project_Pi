import 'package:flutter/material.dart';
import 'package:project_pi/screens/HomePage/home_page.dart';
import 'package:project_pi/screens/LoginPage/LoginInputForm.dart';
import 'package:project_pi/screens/SignUpPage/halaman_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HalamanLogin extends StatefulWidget {
  static const String id = 'Halaman Login';
  @override
  _HalamanLoginState createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Container(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      child: Image(
                        image: AssetImage('assets/images/Cat_Head@4x.png'),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Monochrome Cat Grooming',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    LoginInputForm(
                      prefixicon: Icons.email,
                      hint: 'Email Address',
                      hidetext: false,
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    LoginInputForm(
                      prefixicon: Icons.lock,
                      suffixicon: Icons.visibility,
                      hint: 'Password',
                      hidetext: true,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(width: 50.0),
                        // Text('Remember Me'),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      height: 45.0,
                      width: 330.0,
                      child: RaisedButton(
                        child: Text('LOG IN'),
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
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
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have account? "),
                        GestureDetector(
                          //TODOS:BELOM BISA DIPENCET
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, SignUpPage.id);
                          },
                        ),
                      ],
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
