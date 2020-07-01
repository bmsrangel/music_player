import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'folder_selection_controller.dart';

class FolderSelectionPage extends StatefulWidget {
  final String title;
  const FolderSelectionPage({Key key, this.title = "FolderSelection"})
      : super(key: key);

  @override
  _FolderSelectionPageState createState() => _FolderSelectionPageState();
}

class _FolderSelectionPageState
    extends ModularState<FolderSelectionPage, FolderSelectionController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(
          builder: (_) {
            if (controller.selectedPath == null)
              return InkWell(
                onTap: controller.selectDirectoryPath,
                child: FlareActor(
                  "animations/choose_your_path_button.flr",
                  animation: "choose_directory",
                ),
              );
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
