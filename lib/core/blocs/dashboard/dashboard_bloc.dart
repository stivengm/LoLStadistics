import 'package:bloc/bloc.dart';
import 'package:lol_stadistics/data/models/apis_model.dart';
import 'package:lol_stadistics/gui/views/store_app.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final _store = StoreAppView();

  DashboardBloc() : super(DashboardState()) {

    on<HandleLoading>((event, emit) {
      emit(state.copyWith(loading: event.loading));
    });

    getInformationDataBase();
  }

  getInformationDataBase() async {
    state.loading = true;
    var url = Uri.https('lolskillapp-default-rtdb.firebaseio.com', '/apis.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      _store.apisDataBaseModel = ApisDataBaseModel.fromRawJson(response.body);
      if (_store.apisDataBaseModel.key != null) add(HandleLoading(false));
    }
  }

  getProfileLoLAccount() {
    state.loading = true;
    var url = Uri.https('${_store.regionProfile}.api.riotgames.com', '/lol/summoner/v4/summoners/by-name/${_store.nameInvocador}', {
      "api_key": "RGAPI-acbda1b1-6a6e-45c6-82f8-f9d06ba06adc"
    });
  }

}
