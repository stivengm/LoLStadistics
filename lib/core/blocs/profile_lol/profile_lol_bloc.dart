import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:lol_stadistics/data/models/champ_maestry_test.dart';
import 'package:lol_stadistics/data/models/champions_maestry.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'profile_lol_event.dart';
part 'profile_lol_state.dart';

class ProfileLolBloc extends Bloc<ProfileLolEvent, ProfileLolState> {
  ProfileLolBloc() : super(ProfileLolState()) {

    on<GetChampions>((event, emit) {
      emit(state.copyWith(champions: event.champions));
    });

    getMaestryAccount();

  }

  getMaestryAccount() async {
    state.loading = true;
    
    var url = Uri.https('la1.api.riotgames.com', '/lol/champion-mastery/v4/champion-masteries/by-summoner/Anff-N-IQVmc57c47bHkDYWEO5i5bAJ4_jM5g-U6h6H_ag', {
      "api_key": "RGAPI-136bf637-ee3f-4816-b215-43f38df9ef76"
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      state.loading = true;
      // final championMaestryModel = championMaestryModelFromMap(jsonString);
      final ChampionMaestryModel champions = ChampionMaestryModel.fromJson(response.body);
      // add( GetChampions(champions) );
      add( GetChampionsTest(champions) );
    } else {
      print(response.body);
    }
  }

}
