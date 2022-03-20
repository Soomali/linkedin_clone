import 'package:flutter/material.dart';
import 'package:flutter_app_clone/data/conversation_models.dart';
import 'package:flutter_app_clone/views/tabs/shared/user_leading.dart';
import 'dart:math';
part 'conversation_builder.dart';
part 'message_widget.dart';
part 'message_content.dart';
part 'message_send.dart';
part 'app_bar_pop_up.dart';

final Random _random = Random();

class ConversationPage extends StatelessWidget {
  final Conversation conversation;
  const ConversationPage({Key? key, required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(color: Colors.white, size: 24),
        appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey.shade900),
        scaffoldBackgroundColor: const Color.fromARGB(255, 12, 20, 26),
      ),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 24,
          title: Row(
            children: [
              UserListLeading(
                user: conversation.user,
                radius: 16,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(child: Text(conversation.user.name)),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print('video'),
                  icon: const Icon(Icons.videocam)),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print('phone'),
                  icon: const Icon(Icons.phone)),
              const ConversationAppBarPopUp(),
            ],
          ),
        ),
        body: ConversationBuilder(
          messages: conversation.messages,
        ),
      ),
    );
  }
}
