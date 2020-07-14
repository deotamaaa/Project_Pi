import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryPage extends StatefulWidget {
  static const String id = 'HistoryPage';
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(25.0, 68.0, 70.0, 25.0),
            child: Text(
              'History',
              style: TextStyle(fontSize: 35.0),
            ),
          ),
          Column(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('ReservationData').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final messages = snapshot.data.documents;
                  List<HistoryBox> historyWidgets = [];
                  for (var message in messages) {
                    final historyDate = message.data['Reservation Date'];
                    final historyTime = message.data['Reservation Time'];
                    final historyWidget =
                        HistoryBox(date: historyDate, time: historyTime);
                    historyWidgets.add(historyWidget);
                  }
                  return Column(
                    children: historyWidgets,
                  );
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}

class HistoryBox extends StatelessWidget {
  final String date;
  final String time;

  HistoryBox({this.date, this.time});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Material(
        elevation: 5.0,
        child: Container(
          child: Text(
            'Date Reservation : \n $date and $time',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
