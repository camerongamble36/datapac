import 'package:datapac/providers/datapacs.provider.dart';
import 'package:datapac/providers/users.provider.dart';
import 'package:datapac/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DatapacsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UsersProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Datapac',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
