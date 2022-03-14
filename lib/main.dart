import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_stadistics/core/paths/app_paths.dart';
import 'package:lol_stadistics/core/providers/bloc_provider.dart';
import 'package:lol_stadistics/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providerBloc,
      child: mateApp()
    );
  }

  MaterialApp mateApp() => MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      routes: routesApp(),
      debugShowCheckedModeBanner: false,
      initialRoute: 'dashboard',
    );

}
