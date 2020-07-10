import 'dart:convert';

import 'package:datapac/model/datapac.model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DatapacsProvider with ChangeNotifier {
  List<Datapac> datapacs = [];

  List<Datapac> get allPacs {
    return this.datapacs;
  }

  void addNewDatapac(Datapac datapac) {
    // Send this to an ethereum client node
    const url = '';
    http
        .post(url,
            body: json.encode({
              // Encode json data or Eth ABI?
            }))
        .then((value) {
      final newPac = Datapac(
        title: datapac.title,
        imageUrl: datapac.imageUrl,
      );

      this.datapacs.add(newPac);
    });
    // Send this to an ethereuam client node
  }

  Datapac getDatapac(String id) {
    return this.datapacs.firstWhere((element) => element.id == id);
  }

  // Weekly Pages Read Chart
  List<BarChartGroupData> weeklyPagesReadChart(BuildContext context) {
    return weeklyPagesReadData(
      context,
    );
  }

  List<BarChartGroupData> weeklyPagesReadData(BuildContext context) {
    List<BarChartGroupData> barChartGroupData = [];

    for (int i = 0; i < 6; i++) {
      var sessionData = BarChartGroupData(x: i, barRods: [
        BarChartRodData(y: 11, color: Theme.of(context).primaryColorLight)
      ], showingTooltipIndicators: [
        0
      ]);
      barChartGroupData.add(sessionData);
    }
    return barChartGroupData;
  }
  // Weekly Pages Read Chart
}
