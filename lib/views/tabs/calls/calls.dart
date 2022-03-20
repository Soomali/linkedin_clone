import 'package:flutter/material.dart';
import 'package:flutter_app_clone/data/conversation_models.dart';
import 'package:flutter_app_clone/views/tabs/shared/user_leading.dart';
import 'dart:math';
part 'calls_widget.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 4),
        itemBuilder: ((context, index) {
          return CallListTile(call: Call.random());
        }));
  }
}
