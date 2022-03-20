import 'package:flutter/material.dart';
import 'package:flutter_app_clone/views/app_bar/app_bar.dart';
import 'package:flutter_app_clone/views/app_bar/search_app_bar.dart';
import 'package:flutter_app_clone/views/tabs/tabview.dart';
import 'package:camera/camera.dart';

class MainBody extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MainBody({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            const [SliverToBoxAdapter(), CloneAppBar()],
        body: TabViews(
          cameras: cameras,
        ),
      )),
    );
  }
}
