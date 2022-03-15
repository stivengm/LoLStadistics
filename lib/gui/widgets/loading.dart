import 'package:flutter/material.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}