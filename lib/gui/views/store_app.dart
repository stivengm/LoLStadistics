import 'package:flutter/material.dart';
import 'package:lol_stadistics/data/models/apis_model.dart';
import 'package:lol_stadistics/data/models/champ_maestry_test.dart';
import 'package:lol_stadistics/data/models/images_model.dart';
import 'package:lol_stadistics/data/models/league_model.dart';
import 'package:lol_stadistics/data/models/region_model.dart';
import 'package:lol_stadistics/data/models/summoner_name_model.dart';

class StoreAppView {

  String nameInvocador = '';
  String regionProfile = '';

  ApisDataBaseModel apisDataBaseModel = ApisDataBaseModel();
  SummonerNameModel summonerNameModel = SummonerNameModel();
  LeagueModel leagueModelSoloQ = LeagueModel();
  LeagueModel leagueModelFlex = LeagueModel();
  
  ImagesModel imagesModel = ImagesModel();

  List<LeagueModel> leagueModelList = [];
  List<ChampionMaestryModel> championMaestryModel = [];

  List<RegionModel> region = [
    RegionModel(text: 'BR1', value: 'br1'),
    RegionModel(text: 'EUN1', value: 'eun1'),
    RegionModel(text: 'EUW1', value: 'euw1'),
    RegionModel(text: 'JP1', value: 'jp1'),
    RegionModel(text: 'KR', value: 'kr'),
    RegionModel(text: 'LAN', value: 'la1'),
    RegionModel(text: 'LAS', value: 'la2'),
    RegionModel(text: 'NA1', value: 'na1'),
    RegionModel(text: 'OC1', value: 'oc1'),
    RegionModel(text: 'TR1', value: 'tr1'),
    RegionModel(text: 'RU', value: 'ru'),
  ];

  List<DropdownMenuItem<String>> itemsDropDownRegion() => region
  .map((regionItem) => DropdownMenuItem(
    child: Text(regionItem.text),
    value: regionItem.value,
  )).toList();

  static final StoreAppView _singleton = StoreAppView._();
  factory StoreAppView() => _singleton;
  StoreAppView._();

}