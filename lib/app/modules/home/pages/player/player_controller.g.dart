// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerController on _PlayerControllerBase, Store {
  final _$songPathAtom = Atom(name: '_PlayerControllerBase.songPath');

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

  final _$playerIconAtom = Atom(name: '_PlayerControllerBase.playerIcon');

  @override
  IconData get playerIcon {
    _$playerIconAtom.reportRead();
    return super.playerIcon;
  }

  @override
  set playerIcon(IconData value) {
    _$playerIconAtom.reportWrite(value, super.playerIcon, () {
      super.playerIcon = value;
    });
  }

  final _$musicLengthAtom = Atom(name: '_PlayerControllerBase.musicLength');

  @override
  Duration get musicLength {
    _$musicLengthAtom.reportRead();
    return super.musicLength;
  }

  @override
  set musicLength(Duration value) {
    _$musicLengthAtom.reportWrite(value, super.musicLength, () {
      super.musicLength = value;
    });
  }

  final _$currentPositionAtom =
      Atom(name: '_PlayerControllerBase.currentPosition');

  @override
  Duration get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Duration value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$subscriptionAtom = Atom(name: '_PlayerControllerBase.subscription');

  @override
  StreamSubscription<dynamic> get subscription {
    _$subscriptionAtom.reportRead();
    return super.subscription;
  }

  @override
  set subscription(StreamSubscription<dynamic> value) {
    _$subscriptionAtom.reportWrite(value, super.subscription, () {
      super.subscription = value;
    });
  }

  final _$playAsyncAction = AsyncAction('_PlayerControllerBase.play');

  @override
  Future play() {
    return _$playAsyncAction.run(() => super.play());
  }

  final _$stopAsyncAction = AsyncAction('_PlayerControllerBase.stop');

  @override
  Future stop() {
    return _$stopAsyncAction.run(() => super.stop());
  }

  final _$pauseAsyncAction = AsyncAction('_PlayerControllerBase.pause');

  @override
  Future pause() {
    return _$pauseAsyncAction.run(() => super.pause());
  }

  final _$seekAsyncAction = AsyncAction('_PlayerControllerBase.seek');

  @override
  Future seek(double position) {
    return _$seekAsyncAction.run(() => super.seek(position));
  }

  @override
  String toString() {
    return '''
songPath: ${songPath},
playerIcon: ${playerIcon},
musicLength: ${musicLength},
currentPosition: ${currentPosition},
subscription: ${subscription}
    ''';
  }
}
