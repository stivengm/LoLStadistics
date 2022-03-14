import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Champions"),
        centerTitle: false,
      ),
      body: Text("Dashboard page!"),
    );
  }
}