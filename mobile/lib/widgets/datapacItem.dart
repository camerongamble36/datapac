import 'dart:ui';

import 'package:datapac/model/datapac.model.dart';
import 'package:datapac/screens/datapacDetailScreen.dart';
import 'package:flutter/material.dart';

class DatapacItem extends StatelessWidget {
  final Datapac datapac;

  DatapacItem(this.datapac);

  void navToDatapacDetailScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return DatapacDetailScreen(this.datapac);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.blueGrey,
      child: Card(
        elevation: 3,
        child: GridTile(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            child: Text('23'),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  this.datapac.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  this.datapac.timestamp,
                                  style: TextStyle(fontSize: 12),
                                  softWrap: true,
                                )
                                // Flexible(
                                //   //newly added
                                //   child: Container(
                                //     padding: EdgeInsets.fromLTRB(
                                //         0.0, 0.0, 0.0, 15.0),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Text(this.datapac.description),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.lightGreen,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () => navToDatapacDetailScreen(context),
    );
  }
}
