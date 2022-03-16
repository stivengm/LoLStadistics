import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Champions"),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.menu
          ),
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
        ),
      ),
      body: Column(
        children: [
          const Text("Dashboard"),
          IconButton(
            icon: const Icon(
              Icons.add
            ),
            onPressed: () => Navigator.pushNamed(context, 'profileLol'),
          )
        ],
      )
    );
  }
}
