part of 'conversation.dart';

enum ConversationTapMode { select, text }

class ConversationWidget extends StatefulWidget {
  const ConversationWidget(
      {Key? key,
      required this.conversation,
      this.onAbandon,
      this.onSelected,
      this.mode = ConversationTapMode.text})
      : super(key: key);
  final void Function(Conversation)? onSelected;
  final void Function(Conversation)? onAbandon;
  final Conversation conversation;
  final ConversationTapMode mode;

  @override
  State<ConversationWidget> createState() => _ConversationWidgetState();
}

class _ConversationWidgetState extends State<ConversationWidget> {
  late Conversation conversation;
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    conversation = widget.conversation;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(8, 12, 12, 8),
      style: ListTileStyle.list,
      horizontalTitleGap: 4,
      onLongPress: () {
        setState(() {
          _selected = !_selected;
          if (_selected) {
            widget.onSelected?.call(conversation);
          } else {
            widget.onAbandon?.call(conversation);
          }
        });
      },
      onTap: () {
        if (_selected) {
          setState(() {
            widget.onAbandon?.call(conversation);
            _selected = !_selected;
          });
        } else if (widget.mode == ConversationTapMode.select) {
          setState(() {
            _selected = !_selected;
            if (_selected) {
              widget.onSelected?.call(conversation);
            } else {
              widget.onAbandon?.call(conversation);
            }
          });
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ConversationPage(conversation: conversation)));
        }
      },
      selected: _selected,
      selectedTileColor: Color.fromRGBO(255, 255, 255, .1),
      selectedColor: Colors.grey.shade500,
      leading: _selected
          ? Stack(
              children: [
                UserListLeading(
                  user: conversation.user,
                  onTap: () {
                    Navigator.of(context)
                        .push(UserImagePopUp(conversation.user));
                  },
                ),
                Positioned(
                  child: Container(
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: Colors.green),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  right: 2,
                  bottom: 2,
                ),
              ],
            )
          : UserListLeading(
              user: conversation.user,
              onTap: () {
                Navigator.of(context).push(UserImagePopUp(conversation.user));
              }),
      title: ConversationListTileTitle(conversation: conversation),
      trailing: ConversationListTileTrailing(conversation: conversation),
    );
  }
}

class ConversationListTileTrailing extends StatelessWidget {
  const ConversationListTileTrailing({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        DateWidget(message: conversation.messages.last),
        SizedBox(
          height: conversation.pinned ? 8 : 20,
        ),
        if (conversation.pinned)
          const Icon(
            Icons.pin_drop,
            size: 20,
          )
      ],
    );
  }
}

class ConversationListTileTitle extends StatelessWidget {
  const ConversationListTileTitle({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          conversation.user.name,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        const SizedBox(
          height: 6,
        ),
        MessageWidget(message: conversation.messages.last),
      ],
    );
  }
}
