import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_clone/views/conversation/conversation_page.dart';
import 'package:flutter_app_clone/views/tabs/shared/user_leading.dart';

import '../../../data/conversation_models.dart';
part 'conversation_widget.dart';
part 'message_widget.dart';
part 'date_widget.dart';
part 'user_image_pop_up.dart';

class ConversationTab extends StatefulWidget {
  final void Function(List<Conversation>) onTileStateChanged;
  const ConversationTab({Key? key, required this.onTileStateChanged})
      : super(key: key);

  @override
  State<ConversationTab> createState() => _ConversationTabState();
}

class _ConversationTabState extends State<ConversationTab> {
  final List<Conversation> _selectedConversations = [];
  var mode = ConversationTapMode.text;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 4),
        itemCount: 50,
        itemBuilder: (context, index) {
          final conversation = Conversation.random(50);
          return ConversationWidget(
              conversation: conversation,
              mode: mode,
              onSelected: (conv) {
                _selectedConversations.add(conv);
                widget.onTileStateChanged(_selectedConversations);
                if (_selectedConversations.length == 1) {
                  setState(() {
                    mode = ConversationTapMode.select;
                  });
                }
              },
              onAbandon: (conv) {
                if (_selectedConversations.remove(conv)) {
                  widget.onTileStateChanged(_selectedConversations);
                  if (_selectedConversations.isEmpty) {
                    setState(() {
                      mode = ConversationTapMode.text;
                    });
                  }
                }
              });
        });
  }
}
