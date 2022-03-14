import 'package:flutter/material.dart';
import 'package:lol_stadistics/gui/templates/zoom_drawer.dart';
import 'package:lol_stadistics/gui/views/champions_view/champions_view.dart';
import 'package:lol_stadistics/gui/views/profile_lol_view/profile_lol_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {
  'dashboard':  ( _ ) => const ZoomDrawerApp(),
  'champions':  ( _ ) => const ChampionsView(),
  'profileLol':  ( _ ) => const ProfileLolView(),
};