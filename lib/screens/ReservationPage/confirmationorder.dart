import 'package:flutter/material.dart';

class ConfirmationOrder extends StatefulWidget {
  static const String id = 'ConfirmationOrder';
  @override
  _ConfirmationOrderState createState() => _ConfirmationOrderState();
}

class _ConfirmationOrderState extends State<ConfirmationOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(25.0, 68.0, 70.0, 26.0),
              child: Text(
                'Information Detail',
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
                  ConfirmationText(confirmText: 'Grooming Type : '),
                  ConfirmationText(confirmText: 'Cat Breeds : '),
                  ConfirmationText(confirmText: 'Cat Size :'),
                  ConfirmationText(confirmText: 'Add - On Services : '),
                  ConfirmationText(confirmText: 'Reservation Date : '),
                  ConfirmationText(confirmText: 'Reservation Time: '),
                  ConfirmationText(confirmText: 'Pick Up Address : '),
                  ConfirmationText(confirmText: 'Additional Notes : '),
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
                onPressed: () {},
              ),
            ),
          ],
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
