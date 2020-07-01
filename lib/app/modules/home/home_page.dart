import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: this.controller.page$,
        children: this.controller.pages.map<Widget>((e) => e["page"]).toList(),
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
            onTap: this.controller.onPageChange,
            currentIndex: this.controller.currentIndex,
            iconSize: 18,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 11,
            selectedFontSize: 13,
            selectedItemColor: this.controller.itemColor,
            items: this
                .controller
                .pages
                .map(
                  (e) => BottomNavigationBarItem(
                    title: Text(e["itemName"]),
                    icon: Icon(e["itemIcon"]),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
