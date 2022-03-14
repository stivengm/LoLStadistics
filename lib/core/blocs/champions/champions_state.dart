part of 'champions_bloc.dart';

class ChampionsState {

  ChampionsModel? champions;
  String url;
  bool loading;

  ChampionsState({
    this.champions,
    this.url = 'https://ddragon.leagueoflegends.com/cdn/12.5.1/data/es_ES/champion.json',
    this.loading = false
  });

  ChampionsState copyWith({
    ChampionsModel? champions,
    bool? loading,
  }) => ChampionsState(
    champions: champions ?? this.champions,
    loading: loading ?? this.loading
  );

}

