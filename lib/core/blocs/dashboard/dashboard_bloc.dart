import 'package:bloc/bloc.dart';
import 'package:lol_stadistics/data/models/apis_model.dart';
import 'package:lol_stadistics/data/models/images_model.dart';
import 'package:lol_stadistics/data/models/summoner_name_model.dart';
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
      if (_store.apisDataBaseModel.key != null) {
        getImagesDataBase();
      } 
    } else {

    }
  }

  getImagesDataBase() async {
    var url = Uri.https('lolskillapp-default-rtdb.firebaseio.com', 'imagenes.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var resp = response.body.replaceAll('null,', '');
      _store.imagesModel = ImagesModel.fromRawJson(resp);
      if (_store.imagesModel.league!.isNotEmpty) {
        add(HandleLoading(false));
      }
    }
  }

  getProfileLoLAccount() async {
    add(HandleLoading(true));
    var url = Uri.https('${_store.regionProfile}.api.riotgames.com', '/lol/summoner/v4/summoners/by-name/${_store.nameInvocador}', {
      "api_key": _store.apisDataBaseModel.key
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      add(HandleLoading(false));
      _store.summonerNameModel = SummonerNameModel.fromRawJson(response.body);
      return true;
    } else {
      add(HandleLoading(false));
      return false;
    }
  }

}
