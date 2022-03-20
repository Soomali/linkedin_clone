import 'package:flutter/material.dart';
import 'package:flutter_app_clone/data/conversation_models.dart';

class SelectedAppBar extends StatelessWidget {
  final List<Conversation> conversations;
  const SelectedAppBar({Key? key, required this.conversations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar();
  }
}
