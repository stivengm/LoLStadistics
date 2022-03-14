import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lol_stadistics/gui/templates/menu_view.dart';
import 'package:lol_stadistics/gui/views/champions_view/champions_view.dart';
import 'package:lol_stadistics/gui/views/dashboard_view/dashboard_view.dart';

class ZoomDrawerApp extends StatefulWidget {
  const ZoomDrawerApp({ Key? key }) : super(key: key);

  @override
  State<ZoomDrawerApp> createState() => _ZoomDrawerAppState();
}

class _ZoomDrawerAppState extends State<ZoomDrawerApp> {

  MenuItemModel currentItem = MenuItems.dashboard;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      borderRadius: 40.0,
      angle: 0.0,
      showShadow: true,
      slideWidth: MediaQuery.of(context).size.width * .6,
      backgroundColor: Colors.black26,
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) {
          return MenuDrawerZoomView(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            }
          );
        }
      ),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.dashboard:
        return const DashboardView();
      case MenuItems.champions:
        return const ChampionsView();
      default:
      return const DashboardView();
    }
  }

}