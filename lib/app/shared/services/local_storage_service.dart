import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/playlist_model.dart';
import 'interfaces/local_storage_service_interface.dart';

class LocalStorageService implements ILocalStorageService {
  @override
  Future deleteAllPlaylists() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.remove("playlists");
  }

  @override
  Future deleteFolderPath() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.remove("lastFolderPath");
  }

  @override
  Future deleteSinglePlaylist(List<PlaylistModel> playlists) async {
    await storePlaylists(playlists);
  }

  @override
  Future<String> getFolderPath() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    String path = _storage.getString("lastFolderPath");
    return path;
  }

  @override
  Future<List<PlaylistModel>> getPlaylists() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    String playlists = _storage.getString("playlists");
    if (playlists != null) {
      return List<PlaylistModel>.from((jsonDecode(playlists) as List)
          .map((e) => PlaylistModel.fromJson(e)));
    }
    return null;
  }

  @override
  Future<void> storeFolderPath(String path) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.setString("lastFolderPath", path);
  }

  @override
  Future storePlaylists(List<PlaylistModel> playlists) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> mappedPlaylists =
        playlists.map((e) => e.toJson()).toList();
    String stringifiedPlaylists = jsonEncode(mappedPlaylists);
    await _storage.setString("playlists", stringifiedPlaylists);
  }

  @override
  Future updateFolderPath(String path) async {
    await storeFolderPath(path);
  }

  @override
  Future updatePlaylists(List<PlaylistModel> playlists) async {
    await storePlaylists(playlists);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
