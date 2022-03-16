part of 'profile_lol_bloc.dart';

class ProfileLolState {

  ChampionsMaestryModel? champions;
  ChampionMaestryModel? championsTest;
  bool loading;

  ProfileLolState({
    this.champions,
    this.loading = false,
    this.championsTest
  });

  ProfileLolState copyWith({
    ChampionsMaestryModel? champions,
    bool? loading,
    ChampionMaestryModel? championsTest,
  }) => ProfileLolState(
    champions: champions ?? this.champions,
    loading: loading ?? this.loading,
    championsTest: championsTest ?? this.championsTest
  );

}