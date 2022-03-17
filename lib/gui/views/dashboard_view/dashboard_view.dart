import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lol_stadistics/core/blocs/dashboard/dashboard_bloc.dart';
import 'package:lol_stadistics/gui/views/store_app.dart';
import 'package:lol_stadistics/gui/widgets/flush_bar_widget.dart';
import 'package:lol_stadistics/gui/widgets/loading.dart';
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
            icon: const Icon(Icons.menu),
            onPressed: () => ZoomDrawer.of(context)!.toggle(),
          ),
        ),
        body: _body());
  }

  Widget _body() {
    Size _media = MediaQuery.of(context).size;
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            color: Colors.transparent,
            child: state.loading == false ? Column(
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
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    SizedBox(
                      width: _media.width * .25,
                      child: DropdownButtonFormField(
                          items: _store.itemsDropDownRegion(),
                          decoration: InputDecoration(
                              hintText: 'Región',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          onChanged: (value) {
                            _store.regionProfile = value.toString();
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                PrimaryButton(text: 'Buscar', onPressed: validFormSearchProfile),
                Text(_store.summonerNameModel.name.toString())
              ],
            ) : const LoadingApp(),
          ),
        );
      },
    );
  }

  validFormSearchProfile() async {
    final dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    if (_store.nameInvocador != '' && _store.regionProfile != '') {
      final bool response = await dashboardBloc.getProfileLoLAccount();
      if (response) {
        setState(() {
          _store.nameInvocador = "";
          _store.regionProfile = "";
          Navigator.pushNamed(context, 'profileLol');
        });
      } else {
        FlushBarWidget(
          message: "No se pudo encntrar al usuario ${_store.nameInvocador} en esta región, verifique los datos.",
        ).showNotification(context);
      }
    } else {
      const FlushBarWidget(
        message: "Por favor escriba el nombre del invocador y eliga la región.",
      ).showNotification(context);
    }
  }
}
