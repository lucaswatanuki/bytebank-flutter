import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/bytebank_logo.png')),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              color: Colors.green,
              height: 100,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.people),
                  Text('Add'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              color: Colors.green,
              height: 100,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.people),
                  Text('Add'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
