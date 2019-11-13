import 'package:flutter/material.dart';
import 'package:nflapp/screens/teams_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: TeamsScreen(),
    );
  }
}
