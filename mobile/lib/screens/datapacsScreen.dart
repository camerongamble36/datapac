import 'package:datapac/widgets/datapacsList.dart';
import 'package:flutter/material.dart';

class DataPacsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 32,
      ),
      child: DatapacsList(),
    );
  }
}
