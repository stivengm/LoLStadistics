import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lol_stadistics/core/blocs/champions/champions_bloc.dart';
import 'package:lol_stadistics/gui/views/champions_view/champion_view_store.dart';
import 'package:lol_stadistics/gui/widgets/loading.dart';

class ChampionsView extends StatelessWidget {
  const ChampionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = StoreChampionView();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Campeones"),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.menu
          ),
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
        ),
      ),
      body: BlocBuilder<ChampionsBloc, ChampionsState>(
        builder: (context, state) {
          return state.champions != null ? 
            ListView.builder(
              itemCount: state.champions!.data!.length,
              itemBuilder: ( context, index ) {
                String champion = state.champions!.data!.keys.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    _store.nameChampion = state.champions!.data![champion]!.name!;
                    _store.imgChampion = 'http://ddragon.leagueoflegends.com/cdn/12.5.1/img/champion/${state.champions!.data![champion]!.id!}.png';
                    Navigator.pushNamed(context, 'championsDetail');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: Image.network('http://ddragon.leagueoflegends.com/cdn/12.5.1/img/champion/${state.champions!.data![champion]!.id!}.png'),
                              ),
                              const SizedBox(width: 10.0),
                              Text(state.champions!.data![champion]!.name!, style: Theme.of(context).textTheme.headline6),
                              const SizedBox(width: 10.0),
                              Column(
                                children: [
                                  Image.asset('assets/ea.png', width: 20.0,),
                                  const Text("EA")
                                ],
                              ),
                              const SizedBox(width: 10.0),
                              Column(
                                children: [
                                  Image.asset('assets/riot_point.png', width: 20.0,),
                                  const Text("RP")
                                ],
                              )
                            ],
                          ),
                          const Divider()
                        ],
                      ),
                    ),
                  ),
                );
              }
            ) : const LoadingApp();
        },
      ),
    );
  }
}
