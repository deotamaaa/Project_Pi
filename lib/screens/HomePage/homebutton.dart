import 'package:flutter/material.dart';

class HomeNavButton extends StatelessWidget {
  HomeNavButton({this.prefixIcon, this.textbutton, this.onPressed});

  final IconData prefixIcon;
  final String textbutton;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.0,
      height: 65.0,
      child: MaterialButton(
        color: Colors.white,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(prefixIcon),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25.0, 0, 15.0, 0),
              child: Text(
                textbutton,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              child: Icon(Icons.keyboard_arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
