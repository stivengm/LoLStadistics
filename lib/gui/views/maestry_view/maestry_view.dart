import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_stadistics/core/blocs/profile_lol/profile_lol_bloc.dart';
import 'package:lol_stadistics/data/models/champ_maestry_test.dart';
import 'package:lol_stadistics/gui/views/maestry_view/maestry_view_store.dart';
import 'package:lol_stadistics/gui/views/store_app.dart';
import 'package:lol_stadistics/gui/widgets/loading.dart';

class MaestryView extends StatefulWidget {
  const MaestryView({ Key? key }) : super(key: key);

  @override
  State<MaestryView> createState() => _MaestryViewState();
}

class _MaestryViewState extends State<MaestryView> {
  final _store = StoreAppView();
  final _storeMaestry = StoreMaestryView();

  @override
  void initState() {
    super.initState();
    final blocProvider = BlocProvider.of<ProfileLolBloc>(context);
    blocProvider.getMaestryAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maestría de campeones"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return BlocBuilder<ProfileLolBloc, ProfileLolState>(
      builder: (context, state) {
        return state.loading != true ? SingleChildScrollView(
          child: Center(
            child: Wrap(
              direction: Axis.horizontal,
              children: List.generate(_store.championMaestryModel.length, (index) {
                return itemChampionMaestry(_store.championMaestryModel[index]);
              }),
            ),
          ),
        ) : const LoadingApp();
      }
    );
  }

  itemChampionMaestry(ChampionMaestryModel? champion) {
    return SizedBox(
      width: 120.0,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 110.0,
                alignment: Alignment.center,
                child: Image.network('http://ddragon.leagueoflegends.com/cdn/12.5.1/img/champion/${_storeMaestry.getChampionById(champion!.championId!)}.png', width: 113.0, height: 105.0, fit: BoxFit.contain),
    
              ),
              Container(
                height: 190.0,
                alignment: Alignment.center,
                child: Image.network('${_storeMaestry.getMaestryById(champion.championLevel!)}', width: 113.0, fit: BoxFit.contain,),
              ),
            ],
          ),
          Text("${_storeMaestry.getChampionById(champion.championId!)}"),
          Text("${champion.championPoints}"),
        ],
      ),
    );
  }

}