import 'package:datapac/model/datapac.model.dart';
import 'package:flutter/material.dart';

class DatapacHeader extends StatelessWidget {
  final Datapac datapac;

  DatapacHeader(this.datapac);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              color: this.datapac.imageUrl == null
                  ? Icon(Icons.do_not_disturb)
                  : Colors.white,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(this.datapac.imageUrl),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            this.datapac.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            this.datapac.owner,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.lightGreen,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      this.datapac.description,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        // Row(
        //   children: [
        //     Column(
        //       children: [
        //         Container(
        //           padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        //           decoration: BoxDecoration(
        //             border: Border.all(color: Colors.white),
        //             borderRadius: BorderRadius.circular(16),
        //           ),
        //           child: Text(
        //             'Tests',
        //             style: TextStyle(fontSize: 8, color: Colors.white),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
