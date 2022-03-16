import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lol_stadistics/gui/widgets/flush_bar_widget.dart';
import 'package:lol_stadistics/gui/widgets/primary_button_widget.dart';

class GameNowView extends StatefulWidget {
  const GameNowView({ Key? key }) : super(key: key);

  @override
  State<GameNowView> createState() => _GameNowViewState();
}

class _GameNowViewState extends State<GameNowView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Partida en vivo"),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.menu
          ),
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        color: Colors.transparent,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nombre de invicador',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                )
              ),
            ),
            const SizedBox(height: 20.0),
            PrimaryButton(
              text: 'Buscar',
              onPressed: () => const FlushBarWidget(message: "Por favor escriba el nombre del invocador.",).showNotification(context),
            )
          ],
        ),
      ),
    );
  }

}