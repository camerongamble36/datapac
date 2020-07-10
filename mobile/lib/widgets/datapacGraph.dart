import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:datapac/providers/datapacs.provider.dart';

class DatapacGraph extends StatefulWidget {
  @override
  _DatapacGraphState createState() => _DatapacGraphState();
}

class _DatapacGraphState extends State<DatapacGraph> {
  var graphType = 'basic';

  @override
  Widget build(BuildContext context) {
    final datapacsProvider = Provider.of<DatapacsProvider>(context);
    final pagesReadGraph = datapacsProvider.weeklyPagesReadChart(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      padding: EdgeInsets.all(16),
      // decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
      child: Column(
        children: [
          Text('First Graph'),
          BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 20,
              barTouchData: BarTouchData(
                enabled: false,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: const EdgeInsets.all(0),
                  tooltipBottomMargin: 8,
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    return BarTooltipItem(
                      rod.y.round().toString(),
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  margin: 20,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Mn';
                      case 1:
                        return 'Te';
                      case 2:
                        return 'Wd';
                      case 3:
                        return 'Tu';
                      case 4:
                        return 'Fr';
                      case 5:
                        return 'St';
                      case 6:
                        return 'Sn';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(showTitles: false),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: pagesReadGraph,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.graphType = 'basic';
                    print(this.graphType);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: this.graphType == 'basic'
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  radius: this.graphType == 'basic' ? 18 : 22,
                  child: Icon(
                    Icons.data_usage,
                    color: this.graphType == 'basic'
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 24,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.graphType = 'trending';
                    print(this.graphType);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: this.graphType == 'trending'
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  radius: this.graphType == 'trending' ? 18 : 22,
                  child: Icon(
                    Icons.trending_up,
                    color: this.graphType == 'trending'
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 24,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.graphType = 'location';
                    print(this.graphType);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: this.graphType == 'location'
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  radius: this.graphType == 'location' ? 18 : 22,
                  child: Icon(
                    Icons.person_pin_circle,
                    color: this.graphType == 'location'
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
