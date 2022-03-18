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
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ProfileLolBloc, ProfileLolState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: state.loading != true ? Column(
              children: [
                _header(),
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
                          Text("Victorias: ${_store.leagueModel!.wins}"),
                          Text("Derrotas: ${_store.leagueModel!.losses}"),
                        ],
                      ),
                    )
                  ],
                ),
                Text(_storeProfile.getLeague(_store.leagueModel!.tier)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () =>
                      Navigator.pushNamed(context, 'maestryLoLAccount'),
                )
              ],
            ) : const LoadingApp(),
          );
        },
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [

      ],
    );
  }

}