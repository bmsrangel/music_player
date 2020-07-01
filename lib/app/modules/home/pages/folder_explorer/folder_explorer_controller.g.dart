// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_explorer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FolderExplorerController on _FolderExplorerControllerBase, Store {
  final _$songsInPathAtom =
      Atom(name: '_FolderExplorerControllerBase.songsInPath');

  @override
  ObservableList<SongModel> get songsInPath {
    _$songsInPathAtom.reportRead();
    return super.songsInPath;
  }

  @override
  set songsInPath(ObservableList<SongModel> value) {
    _$songsInPathAtom.reportWrite(value, super.songsInPath, () {
      super.songsInPath = value;
    });
  }

  final _$listFilesFromDirectoryAsyncAction =
      AsyncAction('_FolderExplorerControllerBase.listFilesFromDirectory');

  @override
  Future listFilesFromDirectory(String path) {
    return _$listFilesFromDirectoryAsyncAction
        .run(() => super.listFilesFromDirectory(path));
  }

  final _$_FolderExplorerControllerBaseActionController =
      ActionController(name: '_FolderExplorerControllerBase');

  @override
  dynamic playSong(String songPath) {
    final _$actionInfo = _$_FolderExplorerControllerBaseActionController
        .startAction(name: '_FolderExplorerControllerBase.playSong');
    try {
      return super.playSong(songPath);
    } finally {
      _$_FolderExplorerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
songsInPath: ${songsInPath}
    ''';
  }
}
