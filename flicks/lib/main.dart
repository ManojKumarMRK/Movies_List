import 'package:flutter/material.dart';
import 'package:flicks/screens/movies_list_screen.dart' as MLS;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flicks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MLS.MoviesList(),
    );
  }
}
