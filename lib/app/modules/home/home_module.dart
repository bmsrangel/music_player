import 'package:music_player/app/shared/services/local_storage_service.dart';

import 'pages/settings/settings_controller.dart';
import 'pages/favorites/favorites_controller.dart';
import 'stores/data_store.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sound/flutter_sound.dart';

import '../../shared/services/interfaces/local_storage_service_interface.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'pages/folder_explorer/folder_explorer_controller.dart';
import 'pages/player/player_controller.dart';
import 'pages/playlist/playlist_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Widgets
        Bind((i) => PageController(initialPage: 0)),

        // Stores
        Bind((i) => DataStore(i.get<PageController>())),

        // Lib classes
        Bind((i) => FlutterSoundHelper()),

        // Page controllers
        Bind((i) => PlayerController(), lazy: false),
        Bind((i) => PlaylistController(Modular.get<ILocalStorageService>())),
        Bind((i) => HomeController(i.get<PageController>())),
        Bind((i) => FolderExplorerController(
              i.args.data,
              i.get<FlutterSoundHelper>(),
              Modular.get<LocalStorageService>(),
            )),
        Bind((i) => SettingsController()),
        Bind((i) => FavoritesController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
