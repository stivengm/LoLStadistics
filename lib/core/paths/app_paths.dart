import 'package:flutter/material.dart';
import 'package:lol_stadistics/gui/dashboard/dashboard_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {
  'dashboard':         ( _ ) => const DashboardView(),
};