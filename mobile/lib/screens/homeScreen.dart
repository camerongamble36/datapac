import 'package:datapac/screens/datapacsScreen.dart';
import 'package:datapac/screens/newDataPacScreen.dart';
import 'package:datapac/screens/userProfileScreen.dart';
import 'package:flutter/material.dart';

final tabs = <Widget>[
  Tab(
    icon: Icon(Icons.home),
    text: 'Home',
  ),
  Tab(
    icon: Icon(Icons.person),
    text: 'Me',
  ),
  // Tab(
  //   child: Text('Me'),
  // )
];

final tabScreens = <Widget>[
  DataPacsScreen(),
  UserProfileScreen(),
];

void startNewDatapac(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) {
      return NewDatapacScreen();
    }),
  );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Datapac'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        bottomNavigationBar: TabBar(
          labelColor: Theme.of(context).primaryColor,
          tabs: tabs,
        ),
        body: TabBarView(
          children: tabScreens,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => startNewDatapac(context),
        ),
      ),
    );
  }
}
