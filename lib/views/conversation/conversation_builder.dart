part of 'conversation_page.dart';

class ConversationBuilder extends StatefulWidget {
  final List<Message> messages;

  const ConversationBuilder({Key? key, required this.messages})
      : super(key: key);

  @override
  State<ConversationBuilder> createState() => _ConversationBuilderState();
}

class _ConversationBuilderState extends State<ConversationBuilder> {
  var messages = <Message>[];
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    messages = widget.messages;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              reverse: true,
              controller: _controller,
              padding: const EdgeInsets.symmetric(vertical: 8),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: widget.messages.length,
              itemBuilder: (context, index) {
                return MessageWidget(
                  message: widget.messages[messages.length - index - 1],
                  messageBefore: index == messages.length - 1
                      ? null
                      : widget.messages[messages.length - index - 2],
                );
              }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: MessageSendWidget(
            onSend: (text) {
              setState(() {
                messages.add(Message(
                  message: text,
                  status: MessageStatus.sending,
                  time: DateTime.now(),
                  type: MessageType.sent,
                ));
              });
              _controller.jumpTo(0.0);
            },
          ),
        )
      ],
    );
  }
}
