// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataStore on _DataStoreBase, Store {
  final _$songPathAtom = Atom(name: '_DataStoreBase.songPath');

  @override
  String get songPath {
    _$songPathAtom.reportRead();
    return super.songPath;
  }

  @override
  set songPath(String value) {
    _$songPathAtom.reportWrite(value, super.songPath, () {
      super.songPath = value;
    });
  }

  final _$currentIndexAtom = Atom(name: '_DataStoreBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$_DataStoreBaseActionController =
      ActionController(name: '_DataStoreBase');

  @override
  dynamic setCurrentIndex(int index) {
    final _$actionInfo = _$_DataStoreBaseActionController.startAction(
        name: '_DataStoreBase.setCurrentIndex');
    try {
      return super.setCurrentIndex(index);
    } finally {
      _$_DataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
songPath: ${songPath},
currentIndex: ${currentIndex}
    ''';
  }
}
