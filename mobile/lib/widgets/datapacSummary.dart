import 'package:flutter/material.dart';

class DatapacSummary extends StatelessWidget {
  // final String datapacSummary;

  // DatapacSummary(this.datapacSummary);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text('...'),
      // child: Text(this.datapacSummary.isEmpty || this.datapacSummary == null
      //     ? '...'
      //     : this.datapacSummary),
    );
  }
}
