import 'package:datapac/providers/datapacs.provider.dart';
import 'package:datapac/widgets/datapacItem.dart';
import 'package:datapac/widgets/misc/noDatapacs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatapacsList extends StatelessWidget {
  final pacs = [];
  @override
  Widget build(BuildContext context) {
    final datapacsProvider = Provider.of<DatapacsProvider>(context);
    final datapacs = datapacsProvider.allPacs;
    return datapacs.length <= 0
        ? NoDatapacs()
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: datapacs.length,
            itemBuilder: (BuildContext ctx, int index) {
              return DatapacItem(datapacs[index]);
            },
          );
  }
}
