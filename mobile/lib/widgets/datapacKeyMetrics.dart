import 'package:flutter/material.dart';

class DatapacKeyMetrics extends StatelessWidget {
  // final List<String> metrics;

  // DatapacKeyMetrics(this.metrics);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // this.metrics.contains('rank')
              //     ? Column(
              //         children: [
              //           CircleAvatar(
              //             radius: 24,
              //             child: Text('23'),
              //           ),
              //           Text('Rank')
              //         ],
              //       )
              //     :
              Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: Text('N/A'),
                  ),
                  Text('Rank')
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: Text('73%'),
                  ),
                  Text('Accuracy'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: Text('34'),
                  ),
                  Text('User Int.'),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: Text('23'),
                  ),
                  Text('Views')
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: Text('23'),
                  ),
                  Text('Shares')
                ],
              ),
              // Do Type by icon
              Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: Text('23'),
                  ),
                  Text('Type')
                ],
              ),
              // Do Type by icon
            ],
          ),
        ],
      ),
    );
  }
}
