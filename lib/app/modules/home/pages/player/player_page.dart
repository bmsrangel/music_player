import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'player_controller.dart';

class PlayerPage extends StatefulWidget {
  final String title;
  const PlayerPage({Key key, this.title = "Player"}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends ModularState<PlayerPage, PlayerController> {
  //use 'controller' variable to access controller

  @override
  void dispose() {
    this.controller.subscription?.cancel();
    this.controller.stop();
    super.dispose();
    print("Disposed");
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (_) {
                if (this.controller.songPath == null) {
                  return Center(
                    child: Text("Nenhuma música selecionada"),
                  );
                } else if (this.controller.musicLength.inSeconds == 0) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SleekCircularSlider(
                    min: 0,
                    max:
                        this.controller.musicLength.inSeconds.toDouble() ?? 0.0,
                    appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                        progressBarWidth: 10.0,
                      ),
                      size: screenSize.width * .9,
                      customColors: CustomSliderColors(
                        progressBarColors: [
                          Colors.red,
                          Colors.orange,
                        ],
                        trackColor: Colors.grey[400],
                      ),
                    ),
                    onChangeEnd: (value) {
                      this.controller.seek(value);
                    },
                    initialValue:
                        this.controller.currentPosition.inSeconds.toDouble() ??
                            0.0,
                    innerWidget: (value) => IconButton(
                      icon: Icon(
                        this.controller.playerIcon,
                        size: screenSize.width * .25,
                        color: Colors.black,
                      ),
                      onPressed: this.controller.play,
                    ),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Observer(
                  builder: (_) {
                    if (this.controller.songPath == null) return SizedBox();
                    {
                      return Text(this
                          .controller
                          .currentPosition
                          .toString()
                          .split(".")[0]
                          .substring(2));
                    }
                  },
                ),
                Observer(
                  builder: (_) {
                    if (this.controller.songPath == null) return SizedBox();
                    {
                      return Text(this
                          .controller
                          .musicLength
                          .toString()
                          .split(".")[0]
                          .substring(2));
                    }
                  },
                )
              ],
            ),
            // IconButton(
            //   icon: Icon(Icons.stop),
            //   onPressed: this.controller.stop,
            // ),
          ],
        ),
      ),
    );
  }
}
