import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/services/interfaces/local_storage_service_interface.dart';
import 'folder_selection_controller.dart';
import 'folder_selection_page.dart';

class FolderSelectionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) =>
            FolderSelectionController(Modular.get<ILocalStorageService>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FolderSelectionPage()),
      ];

  static Inject get to => Inject<FolderSelectionModule>.of();
}
