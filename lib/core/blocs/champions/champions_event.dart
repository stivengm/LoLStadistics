part of 'champions_bloc.dart';

@immutable
abstract class ChampionsEvent {}

class GetChampions extends ChampionsEvent {
  final ChampionsModel champions;
  GetChampions(this.champions);
}