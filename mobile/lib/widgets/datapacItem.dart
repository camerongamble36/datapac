import 'package:datapac/screens/datapacDetailScreen.dart';
import 'package:flutter/material.dart';

class DatapacItem extends StatelessWidget {
  void navToDatapacDetailScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return DatapacDetailScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Colors.blueGrey,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Text('23'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Datapac title',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Datapac description'),
                        // Might be better with numbers or metrics instead. Think of marketplace
                      ],
                    ),
                  ),

                  // Expanded(
                  //   child: IconButton(
                  //     icon: Icon(Icons.more_horiz),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () => navToDatapacDetailScreen(context),
    );
  }
}
