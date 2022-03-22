import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:lol_stadistics/data/models/champ_maestry_test.dart';
import 'package:lol_stadistics/data/models/champions_maestry.dart';
import 'package:lol_stadistics/data/models/league_model.dart';
import 'package:lol_stadistics/gui/views/store_app.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'profile_lol_event.dart';
part 'profile_lol_state.dart';

class ProfileLolBloc extends Bloc<ProfileLolEvent, ProfileLolState> {
  final _store = StoreAppView();
  ProfileLolBloc() : super(ProfileLolState()) {
    
    on<HandleLoading>((event, emit) {
      emit(state.copyWith(loading: event.loading));
    });
  }

  getMaestryAccount() async {
    state.loading = true;
    var url = Uri.https('la1.api.riotgames.com', '/lol/champion-mastery/v4/champion-masteries/by-summoner/${_store.summonerNameModel.id}', {
      "api_key": _store.apisDataBaseModel.key
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonMaestryModel = jsonDecode(response.body);
      final List<ChampionMaestryModel> championsMaestryModel = jsonMaestryModel.map<ChampionMaestryModel>((m) => ChampionMaestryModel.fromJson(Map<String, dynamic>.from(m))).toList();
      _store.championMaestryModel = championsMaestryModel;
      add(HandleLoading(false));
    }
  }

  getRankLeagueAccount()  async {
    state.loading = true;
    var url = Uri.https('${_store.regionProfile}.api.riotgames.com', '/lol/league/v4/entries/by-summoner/${_store.summonerNameModel.id}', {
      'api_key': _store.apisDataBaseModel.key
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonLeagueModel = jsonDecode(response.body);
      final List<LeagueModel> leagueModel = jsonLeagueModel.map<LeagueModel>((m) => LeagueModel.fromJson(Map<String, dynamic>.from(m))).toList();
      _store.leagueModelList = leagueModel;
      for (var i = 0; i < _store.leagueModelList.length; i++) {
        switch (_store.leagueModelList[i].queueType) {
          case 'RANKED_SOLO_5x5':
            _store.leagueModelSoloQ = _store.leagueModelList[i];
            break;
          case 'RANKED_FLEX_SR':
            _store.leagueModelFlex = _store.leagueModelList[i];
            break;
          default:
        }
      }

      add(HandleLoading(false));
      return true;
    } else {
      return false;
    }

  }

}
