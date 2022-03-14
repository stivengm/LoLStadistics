import 'package:flutter/material.dart';
import 'package:lol_stadistics/gui/views/champions_view/champions_view.dart';
import 'package:lol_stadistics/gui/views/dashboard_view/dashboard_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {
  'dashboard':  ( _ ) => const DashboardView(),
  'champions':  ( _ ) => const ChampionsView(),
};