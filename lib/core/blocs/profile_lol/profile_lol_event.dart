part of 'profile_lol_bloc.dart';

@immutable
abstract class ProfileLolEvent {}

class HandleLoading extends ProfileLolEvent {
  final bool? loading;
  HandleLoading(this.loading);
}
