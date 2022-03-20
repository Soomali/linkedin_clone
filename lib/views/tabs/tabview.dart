import 'package:flutter/material.dart';
import 'package:flutter_app_clone/views/tabs/calls/calls.dart';
import 'package:flutter_app_clone/views/tabs/camera/camera_tab.dart';
import 'package:flutter_app_clone/views/tabs/conversation/conversation.dart';
import 'package:flutter_app_clone/views/tabs/status/status.dart';
import 'package:camera/camera.dart';
import '../../data/conversation_models.dart';

class TabViews extends StatelessWidget {
  final List<CameraDescription> cameras;
  const TabViews({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      CameraTab(
        cameras: cameras,
      ),
      ConversationTab(onTileStateChanged: ((p0) {
        print(p0.map((e) => e.user.name));
      })),
      const StatusTab(),
      const CallsTab()
    ]);
  }
}
