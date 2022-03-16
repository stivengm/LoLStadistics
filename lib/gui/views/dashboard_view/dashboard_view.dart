import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lol_stadistics/gui/views/store_app.dart';
import 'package:lol_stadistics/gui/widgets/flush_bar_widget.dart';
import 'package:lol_stadistics/gui/widgets/primary_button_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final _store = StoreAppView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.menu
          ),
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
        ),
      ),
      body: _body()
    );
  }

  Widget _body() {
    Size _media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: _media.width * .6,
                  child: TextFormField(
                    onChanged: (value) {
                      _store.nameInvocador = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nombre de invicador',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white
                        )
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 5.0),
                SizedBox(
                  width: _media.width * .25,
                  child: DropdownButtonFormField(
                    items: _store.itemsDropDownRegion(),
                    decoration: InputDecoration(
                        hintText: 'Región',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                    onChanged: (value) {}
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            PrimaryButton(
              text: 'Buscar',
              onPressed: () => _store.nameInvocador != '' ? Navigator.pushNamed(context, 'profileLol') : const FlushBarWidget(message: "Por favor escriba el nombre del invocador.",).showNotification(context),
            )
          ],
        ),
      ),
    );
  }
}
