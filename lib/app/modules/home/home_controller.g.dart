// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<int> _$currentIndexComputed;

  @override
  int get currentIndex =>
      (_$currentIndexComputed ??= Computed<int>(() => super.currentIndex,
              name: '_HomeControllerBase.currentIndex'))
          .value;

  final _$itemColorAtom = Atom(name: '_HomeControllerBase.itemColor');

  @override
  Color get itemColor {
    _$itemColorAtom.reportRead();
    return super.itemColor;
  }

  @override
  set itemColor(Color value) {
    _$itemColorAtom.reportWrite(value, super.itemColor, () {
      super.itemColor = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setCurrentIndex(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setCurrentIndex');
    try {
      return super.setCurrentIndex(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getItemColor(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getItemColor');
    try {
      return super.getItemColor(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemColor: ${itemColor},
currentIndex: ${currentIndex}
    ''';
  }
}
