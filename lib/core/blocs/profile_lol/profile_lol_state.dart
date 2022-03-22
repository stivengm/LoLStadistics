part of 'profile_lol_bloc.dart';

class ProfileLolState {

  bool loading;

  ProfileLolState({
    this.loading = true,
  });

  ProfileLolState copyWith({
    ChampionsMaestryModel? champions,
    bool? loading,
    ChampionMaestryModel? championsTest,
  }) => ProfileLolState(
    loading: loading ?? this.loading,
  );

}