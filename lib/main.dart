import 'package:flutter/material.dart';
import 'package:lol_stadistics/core/paths/app_paths.dart';
import 'package:lol_stadistics/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: AppTheme.darkTheme,
      routes: routesApp(),
      initialRoute: 'dashboard',
    );
  }
}
