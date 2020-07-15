import 'package:datapac/providers/datapacs.provider.dart';
import 'package:datapac/widgets/datapacItem.dart';
import 'package:datapac/widgets/misc/noDatapacs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataPacs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final datapacsProvider = Provider.of<DatapacsProvider>(context);
    final userDatapacs = datapacsProvider.userDatapacs;
    return Container(
      height: 300,
      child: userDatapacs.length <= 0
          ? NoDatapacs()
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: userDatapacs.length,
              itemBuilder: (BuildContext ctx, int index) {
                // return DatapacItem();
                return Text('Test');
              },
            ),
    );
  }
}
