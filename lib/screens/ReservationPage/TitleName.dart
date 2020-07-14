import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  final String titleText;
  final IconData infoIcon;
  final Function onPressed;

  TitleName({this.titleText, this.infoIcon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(45.0, 0, 10.0, 0),
          child: Text(
            titleText,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        IconButton(
            icon: Icon(
              infoIcon,
              size: 25.0,
            ),
            onPressed: onPressed),
      ],
    );
  }
}
