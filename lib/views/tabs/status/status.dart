import 'package:flutter/material.dart';
import 'package:flutter_app_clone/data/conversation_models.dart';
import 'package:status_view/status_view.dart';

part 'status_view.dart';
part 'self_status_view.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 4),
        itemCount: 50,
        itemBuilder: ((context, index) {
          return index == 0
              ? SelfStatusWidget(status: Status.random())
              : StatusWidget(status: Status.random());
        }));
  }
}
