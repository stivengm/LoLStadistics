part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}


class HandleLoading extends DashboardEvent {
  final bool? loading;
  HandleLoading(this.loading);
}
