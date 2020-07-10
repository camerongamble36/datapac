import 'package:flutter/material.dart';

class NewDatapacScreen extends StatelessWidget {
  void submitDatapac() {
    print('Submitted datapac');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Pac'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Center(
              child: Text('Datapac pic input'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(32),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Image Url'),
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Title'),
                ),
                TextFormField(),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  onPressed: () {
                    print('Import document');
                  },
                  child: Text('Import'),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          child: Text('23'),
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
          ),
          // SizedBox(
          //   height: 32,
          // ),
          Container(
            margin: EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text('Public'), Text('1 - 100')],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Text('Submit'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () => submitDatapac(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
