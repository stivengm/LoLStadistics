
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_stadistics/core/blocs/champions/champions_bloc.dart';
import 'package:lol_stadistics/core/blocs/profile_lol/profile_lol_bloc.dart';

final List<BlocProvider> providerBloc = [
  BlocProvider<ChampionsBloc>(create: (_) => ChampionsBloc()),
  BlocProvider<ProfileLolBloc>(create: (_) => ProfileLolBloc()),
];