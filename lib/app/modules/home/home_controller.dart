import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:music_player/app/modules/home/pages/favorites/favorites_page.dart';
import 'package:music_player/app/modules/home/pages/settings/settings_page.dart';
import 'package:music_player/app/modules/home/stores/data_store.dart';

import 'pages/folder_explorer/folder_explorer_page.dart';
import 'pages/playlist/playlist_page.dart';
import 'pages/player/player_page.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PageController page$;
  final DataStore _store = Modular.get();

  _HomeControllerBase(this.page$) {
    this.getItemColor(this.page$.initialPage);
  }

  // Colors generator: https://meyerweb.com/eric/tools/color-blend/#::1:hex
  List<Map> pages = [
    {
      "page": FolderExplorerPage(),
      "itemName": "Explorer",
      "itemIcon": Icons.explore,
      "itemColor": 0xFFFF9800,
    },
    {
      "page": PlaylistPage(),
      "itemName": "Playlists",
      "itemIcon": Icons.format_list_bulleted,
      "itemColor": 0xFFFC830E,
    },
    {
      "page": PlayerPage(),
      "itemName": "Player",
      "itemIcon": Icons.play_circle_outline,
      "itemColor": 0xFFFA6E1B,
    },
    {
      "page": FavoritesPage(),
      "itemName": "Favorites",
      "itemIcon": Icons.favorite,
      "itemColor": 0xFFF75829,
    },
    {
      "page": SettingsPage(),
      "itemName": "Settings",
      "itemIcon": Icons.settings_applications,
      "itemColor": 0xFFF44336,
    },
  ];

  // @observable
  // int currentIndex = 0;

  @action
  setCurrentIndex(int index) {
    this._store.currentIndex = index;
  }

  // @observable
  // String songPath;

  onPageChange(int index) {
    this._store.onPageChange(index);
    this.getItemColor(index);
  }

  @computed
  int get currentIndex => this._store.currentIndex;

  @observable
  Color itemColor;

  @action
  getItemColor(int index) {
    this.itemColor = Color(this.pages[index]["itemColor"]);
  }
}
