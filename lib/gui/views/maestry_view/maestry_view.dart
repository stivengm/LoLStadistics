import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_stadistics/core/blocs/profile_lol/profile_lol_bloc.dart';
import 'package:lol_stadistics/gui/widgets/loading.dart';

class MaestryView extends StatelessWidget {
  const MaestryView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return BlocBuilder<ProfileLolBloc, ProfileLolState>(
      builder: (context, state) {
        return Column(
          children: [
            state.champions != null ? Wrap(
              children: [
                ListView.builder(
                  itemCount: state.champions!.toJson().length,
                  itemBuilder: (context, index) {
                    return Text(state.champions!.championId.toString());
                  }
                )
              ],
            ) : const LoadingApp()
          ],
        );
      },
    );
  }

}