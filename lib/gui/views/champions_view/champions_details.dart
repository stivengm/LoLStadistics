import 'package:flutter/material.dart';
import 'package:lol_stadistics/gui/views/champions_view/champion_view_store.dart';

class ChampionsDetail extends StatefulWidget {
  const ChampionsDetail({ Key? key }) : super(key: key);

  @override
  State<ChampionsDetail> createState() => _ChampionsDetailState();
}

class _ChampionsDetailState extends State<ChampionsDetail> {
  final _store = StoreChampionView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_store.nameChampion),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Image.network(_store.imgChampion)
      ],
    );
  }
}