import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'data_store.g.dart';

class DataStore = _DataStoreBase with _$DataStore;

abstract class _DataStoreBase with Store {
  final PageController _page$;

  _DataStoreBase(this._page$);

  @observable
  String songPath;

  @observable
  int currentIndex = 0;

  @action
  setCurrentIndex(int index) {
    this.currentIndex = index;
  }

  onPageChange(int index) {
    this.setCurrentIndex(index);
    this._page$.jumpToPage(index);
  }
}
