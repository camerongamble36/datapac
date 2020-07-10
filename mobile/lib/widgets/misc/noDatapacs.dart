import 'package:flutter/material.dart';

class NoDatapacs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Icon(Icons.not_interested),
          Text('No pacs'),
        ],
      ),
    );
  }
}
