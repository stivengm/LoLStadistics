part of 'dashboard_bloc.dart';

class DashboardState {

  bool? loading;

  DashboardState({
    this.loading = true,
  });

  DashboardState copyWith({
    bool? loading
  }) => DashboardState(
    loading: loading ?? this.loading
  );

}