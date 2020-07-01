import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'folder_explorer_controller.dart';

class FolderExplorerPage extends StatefulWidget {
  final String title;
  const FolderExplorerPage({Key key, this.title = "FolderExplorer"})
      : super(key: key);

  @override
  _FolderExplorerPageState createState() => _FolderExplorerPageState();
}

class _FolderExplorerPageState
    extends ModularState<FolderExplorerPage, FolderExplorerController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double statusbarHeight = MediaQuery.of(context).padding.top;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Column(
          children: <Widget>[
            SizedBox(height: statusbarHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.list,
                    size: 28,
                  ),
                  onPressed: this.controller.selectFolder,
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 28,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.songsInPath.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(left: 16.0),
                        title: Text(controller.songsInPath[index].title),
                        subtitle: Text(controller.songsInPath[index].artist),
                        onTap: () {
                          this.controller.playSong(
                              this.controller.songsInPath[index].path);
                        },
                        trailing: Container(
                          width: MediaQuery.of(context).size.width * .3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(controller.songsInPath[index].duration
                                  .toString()
                                  .split(".")[0]
                                  .substring(2)),
                              IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
