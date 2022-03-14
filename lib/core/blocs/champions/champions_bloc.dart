import 'package:bloc/bloc.dart';
import 'package:lol_stadistics/data/models/champions_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'champions_event.dart';
part 'champions_state.dart';

class ChampionsBloc extends Bloc<ChampionsEvent, ChampionsState> {
  ChampionsBloc() : super(ChampionsState()) {
    on<GetChampions>((event, emit) {
      emit(state.copyWith(champions: event.champions));
    });

    getChampions();
  }

  getChampions() async {
    state.loading = true;
    var url = Uri.https('ddragon.leagueoflegends.com', '/cdn/12.5.1/data/es_ES/champion.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      state.loading = true;
      final ChampionsModel champions = ChampionsModel.fromRawJson(response.body);
      add( GetChampions(champions) );
    }
  }

}
