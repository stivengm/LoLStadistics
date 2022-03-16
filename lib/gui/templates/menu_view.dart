import 'package:flutter/material.dart';

class MenuItemModel {
  final String title;
  final String icon;
  const MenuItemModel(this.title, this.icon);
}

class MenuItems {
  static const dashboard = MenuItemModel('Inicio', 'assets/icons/home.svg');
  static const champions = MenuItemModel('Campeones', 'assets/icons/cart.svg');
  static const gameNow = MenuItemModel('Partida en vivo', 'assets/icons/cart.svg');

  static const all = <MenuItemModel>[
    dashboard,
    champions,
    gameNow
  ];

}

class MenuDrawerZoomView extends StatefulWidget {
  final MenuItemModel currentItem;
  final ValueChanged<MenuItemModel> onSelectedItem;

  const MenuDrawerZoomView({ 
    Key? key,
    required this.currentItem,
    required this.onSelectedItem
  }) : super(key: key);

  @override
  State<MenuDrawerZoomView> createState() => _MenuDrawerZoomViewState();
}

class _MenuDrawerZoomViewState extends State<MenuDrawerZoomView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF4B5669),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          width: size.width * .5,
          child: Column(
            children: [
              const Text("Hollaaaa mundoooo!!"),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ...MenuItems.all.map(buildMenuItem).toList()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItemModel item) {
    return ListTileTheme(
      selectedColor: Colors.white,
      child: ListTile(
        selectedColor: Colors.black,
        selected: widget.currentItem == item,
        minLeadingWidth: 20,
        // leading: SvgPicture.asset(item.icon, color: whiteColor),
        title: Text(item.title, style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white)),
        onTap: () => widget.onSelectedItem(item),
      ),
    );
  }
}