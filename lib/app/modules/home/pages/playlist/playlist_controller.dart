import 'package:mobx/mobx.dart';

import '../../../../shared/models/playlist_model.dart';
import '../../../../shared/services/interfaces/local_storage_service_interface.dart';

part 'playlist_controller.g.dart';

class PlaylistController = _PlaylistControllerBase with _$PlaylistController;

abstract class _PlaylistControllerBase with Store {
  final ILocalStorageService _storage;

  _PlaylistControllerBase(this._storage) {
    this._init();
  }

  @observable
  ObservableList<PlaylistModel> playlists;

  _init() async {
    List<PlaylistModel> temp = await this._storage.getPlaylists();
    if (temp != null) {
      this.playlists = ObservableList.of(temp).asObservable();
    } else {
      this.playlists = <PlaylistModel>[].asObservable();
    }
  }
}
