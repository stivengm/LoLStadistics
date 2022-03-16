import 'package:flutter/material.dart';
import 'package:lol_stadistics/data/models/region_model.dart';

class StoreAppView {

  String nameInvocador = "";
  String regionProfile = "";

  List<RegionModel> region = [
    RegionModel(text: 'LAN', value: 'la1'),
    RegionModel(text: 'LAS', value: 'la2'),
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