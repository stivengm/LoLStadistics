part of 'profile_lol_bloc.dart';

@immutable
abstract class ProfileLolEvent {}

class HandleLoading extends ProfileLolEvent {
  final bool? loading;
  HandleLoading(this.loading);
}

class GetChampions extends ProfileLolEvent {
  final ChampionsMaestryModel champions;
  GetChampions(this.champions);
}

class GetChampionsTest extends ProfileLolEvent {
  final ChampionMaestryModel championsTest;
  GetChampionsTest(this.championsTest);
}