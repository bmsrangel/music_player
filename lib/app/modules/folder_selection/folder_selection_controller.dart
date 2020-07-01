import 'package:file_picker/file_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/services/interfaces/local_storage_service_interface.dart';

part 'folder_selection_controller.g.dart';

class FolderSelectionController = _FolderSelectionControllerBase
    with _$FolderSelectionController;

abstract class _FolderSelectionControllerBase with Store {
  final ILocalStorageService _storage;

  _FolderSelectionControllerBase(this._storage) {
    this._init();
  }

  @observable
  String selectedPath = "";

  @action
  selectDirectoryPath() async {
    this.selectedPath = await FilePicker.getDirectoryPath();
    await _storage.storeFolderPath(this.selectedPath);
    Modular.to.pushReplacementNamed("/home", arguments: this.selectedPath);
  }

  @action
  _init() async {
    this.selectedPath = await this._storage.getFolderPath();
    if (this.selectedPath != null) {
      Modular.to.pushReplacementNamed("/home", arguments: this.selectedPath);
    }
  }
}
