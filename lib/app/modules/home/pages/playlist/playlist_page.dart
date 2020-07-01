import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'playlist_controller.dart';

class PlaylistPage extends StatefulWidget {
  final String title;
  const PlaylistPage({Key key, this.title = "Playlist"}) : super(key: key);

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState
    extends ModularState<PlaylistPage, PlaylistController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (this.controller.playlists == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (this.controller.playlists.length == 0) {
            return Center(
              child: Text("Ainda não há playlists criadas!"),
            );
          } else {
            return ListView.builder(
              itemCount: this.controller.playlists.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(this.controller.playlists[index].name),
                );
              },
            );
          }
        },
      ),
    );
  }
}
