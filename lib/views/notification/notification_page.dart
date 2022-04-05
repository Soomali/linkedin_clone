import 'package:flutter/material.dart';
import 'package:flutter_app_clone/data/data.dart';

import '../appBar/app_bar.dart';

part 'notification_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).primaryColor,
      child: CustomScrollView(
        slivers: [
          const LinkedInAppBar(),
          SliverList(
              delegate: SliverChildBuilderDelegate(((context, index) {
            return NotificationWidget(notification: NotificationData.random());
          }), childCount: 100)),
        ],
      ),
    );
  }
}
