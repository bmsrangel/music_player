import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mobx/mobx.dart';
import 'package:music_player/app/shared/services/interfaces/local_storage_service_interface.dart';

import '../../../../shared/models/song_model.dart';
import '../../stores/data_store.dart';

part 'folder_explorer_controller.g.dart';

class FolderExplorerController = _FolderExplorerControllerBase
    with _$FolderExplorerController;

abstract class _FolderExplorerControllerBase with Store {
  final String _path;
  final FlutterSoundHelper _soundHelper;
  final DataStore _store = Modular.get();
  final ILocalStorageService _storage;

  _FolderExplorerControllerBase(this._path, this._soundHelper, this._storage) {
    this._init();
  }

  @observable
  ObservableList<SongModel> songsInPath = <SongModel>[].asObservable();

  _init() {
    this.listFilesFromDirectory(this._path);
  }

  @action
  listFilesFromDirectory(String path) async {
    if (path != null) {
      List<FileSystemEntity> file = Directory(path).listSync();
      this.songsInPath.clear();
      file.forEach((element) {
        if (element.statSync().type == FileSystemEntityType.directory) {
          return listFilesFromDirectory(element.path);
        }
        if (element.path.split(".").last == "mp3") {
          _soundHelper.FFmpegGetMediaInformation(element.path).then(
            (value) => songsInPath.add(
              SongModel.fromMap(value),
            ),
          );
        }
        return;
      });
    }
  }

  @action
  playSong(String songPath) {
    this._store.songPath = songPath;
    this._store.onPageChange(2);
  }

  selectFolder() async {
    await _storage.deleteFolderPath();
    Modular.to.pushReplacementNamed("/");
  }
}
