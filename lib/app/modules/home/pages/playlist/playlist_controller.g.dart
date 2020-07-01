// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaylistController on _PlaylistControllerBase, Store {
  final _$playlistsAtom = Atom(name: '_PlaylistControllerBase.playlists');

  @override
  ObservableList<PlaylistModel> get playlists {
    _$playlistsAtom.reportRead();
    return super.playlists;
  }

  @override
  set playlists(ObservableList<PlaylistModel> value) {
    _$playlistsAtom.reportWrite(value, super.playlists, () {
      super.playlists = value;
    });
  }

  @override
  String toString() {
    return '''
playlists: ${playlists}
    ''';
  }
}
