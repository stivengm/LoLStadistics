import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBarWidget extends StatelessWidget {
  final String message;
  const FlushBarWidget({ Key? key, required this.message }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  showNotification(BuildContext context) => Flushbar(
    duration: const Duration(seconds: 2),
    title: "LoLStadistics",
    message: message,
    borderRadius: BorderRadius.circular(18),
    barBlur: 20,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(context);

}