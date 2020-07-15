import 'package:flutter/material.dart';

class NoDatapacs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            child: Icon(Icons.not_interested),
          ),
          SizedBox(
            height: 16,
          ),
          Text('No Datapacs'),
        ],
      ),
    );
  }
}
