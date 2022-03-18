
class StoreProfileLoLView {

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

  static final StoreProfileLoLView _singleton = StoreProfileLoLView._();
  factory StoreProfileLoLView() => _singleton;
  StoreProfileLoLView._();

}