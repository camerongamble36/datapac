import 'package:datapac/model/datapac.model.dart';
import 'package:datapac/widgets/datapacGraph.dart';
import 'package:datapac/widgets/datapacHeader.dart';
import 'package:datapac/widgets/datapacKeyMetrics.dart';
import 'package:datapac/widgets/datapacSummary.dart';
import 'package:flutter/material.dart';

class DatapacDetailScreen extends StatelessWidget {
  final Datapac datapac;

  DatapacDetailScreen(this.datapac);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(this.datapac.title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            height: 250,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: DatapacHeader(this.datapac),
          ),
          // DatapacSummary(this.datapac.summary),
          // DatapacKeyMetrics(this.datapac.metrics),
          DatapacSummary(),
          DatapacKeyMetrics(),
          DatapacGraph(),
        ],
      ),
    );
  }
}
