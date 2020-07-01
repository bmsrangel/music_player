import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mobx/mobx.dart';
import 'package:music_player/app/modules/home/stores/data_store.dart';

part 'player_controller.g.dart';

class PlayerController = _PlayerControllerBase with _$PlayerController;

abstract class _PlayerControllerBase with Store {
  FlutterSoundPlayer player = FlutterSoundPlayer();
  final DataStore _store = Modular.get();

  @observable
  String songPath;

  @observable
  IconData playerIcon = Icons.play_arrow;

  @observable
  Duration musicLength = Duration(milliseconds: 0);

  @observable
  Duration currentPosition = Duration(milliseconds: 0);

  @observable
  StreamSubscription subscription;

  _PlayerControllerBase() {
    this.songPath = this._store.songPath;
    if (this.songPath != null) {
      play();
    }
  }

  @action
  play() async {
    print(this.songPath);

    print("State: ${this.player.playerState}");
    if (this.player.playerState == PlayerState.isPaused ||
        this.player.playerState == PlayerState.isStopped) {
      if (this.player.playerState == PlayerState.isStopped) {
        await this.player.openAudioSession(audioFlags: outputToSpeaker);
      }
      this.playerIcon = Icons.pause;
      this.subscription = this.player.onProgress.listen((event) {
        this.musicLength = event.duration;
        this.currentPosition = event.position;
      });
      if (this.player.playerState == PlayerState.isStopped) {
        await this.player.startPlayer(
            fromURI: this.songPath,
            codec: Codec.mp3,
            whenFinished: () async {
              await this.stop();
            });
      } else {
        this.player.resumePlayer();
      }
    } else {
      {
        this.pause();
      }
    }
  }

  @action
  stop() async {
    if (this.player.playerState != PlayerState.isStopped) {
      this.playerIcon = Icons.play_arrow;
      await this.player.stopPlayer();
      await player.closeAudioSession();
      subscription.cancel();
    }
    this.currentPosition = Duration(seconds: 0);
  }

  @action
  pause() async {
    await this.player.pausePlayer();
    this.playerIcon = Icons.play_arrow;
  }

  @action
  seek(double position) async {
    int roundedPosition = position.round();
    this.player.seekToPlayer(Duration(seconds: roundedPosition));
  }
}
