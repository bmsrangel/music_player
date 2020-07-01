import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/folder_selection/folder_selection_module.dart';
import 'modules/home/home_module.dart';
import 'shared/services/interfaces/local_storage_service_interface.dart';
import 'shared/services/local_storage_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ILocalStorageService>((i) => LocalStorageService()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: FolderSelectionModule()),
        Router("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
