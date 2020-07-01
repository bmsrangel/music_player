// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_selection_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FolderSelectionController on _FolderSelectionControllerBase, Store {
  final _$selectedPathAtom =
      Atom(name: '_FolderSelectionControllerBase.selectedPath');

  @override
  String get selectedPath {
    _$selectedPathAtom.reportRead();
    return super.selectedPath;
  }

  @override
  set selectedPath(String value) {
    _$selectedPathAtom.reportWrite(value, super.selectedPath, () {
      super.selectedPath = value;
    });
  }

  final _$selectDirectoryPathAsyncAction =
      AsyncAction('_FolderSelectionControllerBase.selectDirectoryPath');

  @override
  Future selectDirectoryPath() {
    return _$selectDirectoryPathAsyncAction
        .run(() => super.selectDirectoryPath());
  }

  final _$_initAsyncAction =
      AsyncAction('_FolderSelectionControllerBase._init');

  @override
  Future _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  @override
  String toString() {
    return '''
selectedPath: ${selectedPath}
    ''';
  }
}
