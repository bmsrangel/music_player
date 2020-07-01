import 'package:flutter_modular/flutter_modular.dart';

import '../../models/playlist_model.dart';

abstract class ILocalStorageService implements Disposable {
  Future<String> getFolderPath();
  Future<void> storeFolderPath(String path);
  Future<void> deleteFolderPath();
  Future<void> updateFolderPath(String path);
  Future<List<PlaylistModel>> getPlaylists();
  Future<void> storePlaylists(List<PlaylistModel> playlists);
  Future<void> deleteAllPlaylists();
  Future<void> deleteSinglePlaylist(List<PlaylistModel> playlists);
  Future<void> updatePlaylists(List<PlaylistModel> playlists);
}
