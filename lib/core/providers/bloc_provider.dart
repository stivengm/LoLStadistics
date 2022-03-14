
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_stadistics/core/blocs/champions/champions_bloc.dart';

final List<BlocProvider> providerBloc = [
  BlocProvider<ChampionsBloc>(create: (_) => ChampionsBloc()),
];