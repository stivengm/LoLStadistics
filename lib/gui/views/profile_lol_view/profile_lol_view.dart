import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_stadistics/core/blocs/profile_lol/profile_lol_bloc.dart';
import 'package:lol_stadistics/gui/views/profile_lol_view/profile_lol_store.dart';
import 'package:lol_stadistics/gui/views/store_app.dart';
import 'package:lol_stadistics/gui/widgets/loading.dart';

class ProfileLolView extends StatefulWidget {
  const ProfileLolView({Key? key}) : super(key: key);

  @override
  State<ProfileLolView> createState() => _ProfileLolViewState();
}

class _ProfileLolViewState extends State<ProfileLolView> {
  @override
  void initState() {
    super.initState();
    final blocProvider = BlocProvider.of<ProfileLolBloc>(context);
    blocProvider.getRankLeagueAccount();
  }

  @override
  Widget build(BuildContext context) {
    final _store = StoreAppView();
    final _storeProfile = StoreProfileLoLView();
    Size _media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ProfileLolBloc, ProfileLolState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: state.loading != true ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  const SizedBox(height: 50.0),
                  Row(
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: NetworkImage('https://ddragon.leagueoflegends.com/cdn/12.5.1/img/profileicon/${_store.summonerNameModel.profileIconId}.png'),
                          )
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_store.summonerNameModel.name.toString()),
                            const SizedBox(height: 20.0),
                            Text('Nivel: ${_store.summonerNameModel.summonerLevel}'),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  _store.leagueModelSoloQ.tier != '' && _store.leagueModelSoloQ.tier != null ? const Text("Clasificatoria Sólo/Dúo") : const SizedBox(),
                  _store.leagueModelSoloQ.tier != '' && _store.leagueModelSoloQ.tier != null ? SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network('${_storeProfile.getEmblem(_store.leagueModelSoloQ.tier)}', width: _media.width * .4,),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20.0),
                              Text("${_storeProfile.getLeague(_store.leagueModelSoloQ.tier!)} ${_store.leagueModelSoloQ.rank}"),
                              Text("${_store.leagueModelSoloQ.leaguePoints} LP / ${_store.leagueModelSoloQ.wins}V ${_store.leagueModelSoloQ.losses}D"),
                              const Text("WinRate: ")
                            ],
                          ),
                        )
                      ],
                    ),
                  ) : const SizedBox(),
                  const SizedBox(height: 20.0),
                  _store.leagueModelFlex.tier != null && _store.leagueModelFlex.tier != '' ? const Text("Clasificatoria Flexible") : const SizedBox(),
                  _store.leagueModelFlex.tier != null && _store.leagueModelFlex.tier != '' ? SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network('${_storeProfile.getEmblem(_store.leagueModelFlex.tier)}', width: _media.width * .4,),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20.0),
                              Text("${_storeProfile.getLeague(_store.leagueModelFlex.tier!)} ${_store.leagueModelFlex.rank}"),
                              Text("${_store.leagueModelFlex.leaguePoints} LP / ${_store.leagueModelFlex.wins}V ${_store.leagueModelFlex.losses}D"),
                              const Text("WinRate: ")
                            ],
                          ),
                        )
                      ],
                    ),
                  ) : const SizedBox(),
                ],
              ),
            ) : const LoadingApp(),
          );
        },
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        GestureDetector(
          child: const Text("Maestría de campeones"),
          onTap: () {
            Navigator.pushNamed(context, 'maestryLoLAccount');
          },
        ),
      ],
    );
  }

}