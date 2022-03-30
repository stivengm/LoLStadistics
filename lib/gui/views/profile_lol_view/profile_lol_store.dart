
import 'package:lol_stadistics/gui/views/store_app.dart';

class StoreProfileLoLView {

  final _store = StoreAppView();

  getLeague(league) {
    switch (league) {
      case "IRON":
        return 'HIERRO';
      case "BRONZE":
        return 'BRONCE';
      case "SILVER":
        return 'PLATA';
      case "GOLD":
        return 'ORO';
      case "PLATINUM":
        return 'PLATINO';
      case "DIAMOND":
        return 'DIAMANTE';
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
      case "GOLD":
        return "${_store.imagesModel.league![4]!.url}";
      case "PLATINUM":
        return "${_store.imagesModel.league![5]!.url}";
      case "DIAMOND":
        return "${_store.imagesModel.league![6]!.url}";
      default:
        return "${_store.imagesModel.league![0]!.url}";
    }
  }

  static final StoreProfileLoLView _singleton = StoreProfileLoLView._();
  factory StoreProfileLoLView() => _singleton;
  StoreProfileLoLView._();

}