import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_stadistics/core/blocs/champions/champions_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Champions"),
        centerTitle: false,
      ),
      body: BlocBuilder<ChampionsBloc, ChampionsState>(
        builder: (context, state) {
          return state.champions != null ? Container(
            child: ListView.builder(
              itemCount: state.champions!.data!.length,
              itemBuilder: ( context, index ) {
                String champion = state.champions!.data!.keys.elementAt(index);
                return Text(state.champions!.data![champion]!.name!);
              }
            ),
          ) : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
