
import 'package:lol_stadistics/gui/views/store_app.dart';

class StoreProfileLoLView {

  final _store = StoreAppView();

  getLeague(league) {
    switch (league) {
      case "SILVER":
        return 'PLATA';
      case "GOLD":
        return 'ORO';
      case "PLATINUM":
        return 'PLATINO';
      default:
        return 'UNRANKED';
    }
  }

  getEmblem(league) {
    switch (league) {
      case "UNRANKED":
        return "${_store.imagesModel.league![0]!.url}";
      case "IRON":
        return "${_store.imagesModel.league![1]!.url}";
      case "BRONZE":
        return "${_store.imagesModel.league![2]!.url}";
      case "SILVER":
        return "${_store.imagesModel.league![3]!.url}";
      default:
        return "${_store.imagesModel.league![0]!.url}";
    }
  }

  static final StoreProfileLoLView _singleton = StoreProfileLoLView._();
  factory StoreProfileLoLView() => _singleton;
  StoreProfileLoLView._();

}