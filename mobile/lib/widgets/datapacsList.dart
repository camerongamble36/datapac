import 'package:datapac/widgets/datapacItem.dart';
import 'package:flutter/material.dart';

class DatapacsList extends StatelessWidget {
  final pacs = [];
  @override
  Widget build(BuildContext context) {
    // final datapacsProvider = Provider.of<DatapacsProvider>(context);
    // final datapacs = datapacsProvider.allPacs;
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return DatapacItem();
      },
      itemCount: 10,
    );
    // Container(
    //   child: this.datapacs <= 0 || this.datapacs == null
    //       ? NoDatapacs()
    //       : DatapacsList(),
    // );
  }
}
