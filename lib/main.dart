import 'package:flutter/material.dart';
import 'package:equations/equations.dart';
import 'package:sumaiya/Screens/graph_screen.dart';
import 'package:sumaiya/Screens/home_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage()
    );
  }
}

