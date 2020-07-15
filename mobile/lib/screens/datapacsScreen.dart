import 'package:datapac/widgets/datapacsList.dart';
import 'package:flutter/material.dart';

class DataPacsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: DatapacsList(),
    );
  }
}
