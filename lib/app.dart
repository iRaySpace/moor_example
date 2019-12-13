import 'package:flutter/material.dart';
import 'package:moor_example/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Moor Demo',
    home: HomeScreen(),
  );
}
