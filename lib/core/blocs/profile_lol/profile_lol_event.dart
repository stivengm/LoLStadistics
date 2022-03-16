part of 'profile_lol_bloc.dart';

@immutable
abstract class ProfileLolEvent {}


class GetChampions extends ProfileLolEvent {
  final ChampionsMaestryModel champions;
  GetChampions(this.champions);
}

class GetChampionsTest extends ProfileLolEvent {
  final ChampionMaestryModel championsTest;
  GetChampionsTest(this.championsTest);
}