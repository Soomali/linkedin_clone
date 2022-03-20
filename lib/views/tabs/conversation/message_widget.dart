part of 'conversation.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  const MessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final Icon icon;
    switch (message.status) {
      case MessageStatus.sending:
        icon = const Icon(
          Icons.av_timer,
          size: 16,
        );
        break;
      case MessageStatus.sent:
        icon = const Icon(
          Icons.check,
          size: 16,
        );
        break;
      case MessageStatus.received:
        icon = const Icon(
          Icons.checklist_sharp,
          size: 16,
        );
        break;
      case MessageStatus.read:
        icon = const Icon(
          Icons.checklist_sharp,
          color: Colors.blue,
          size: 16,
        );
        break;
    }
    return Row(
      children: [
        icon,
        SizedBox(
          width: 6,
        ),
        Text(
          message.message,
          style: TextStyle(color: Colors.grey.shade500),
        )
      ],
    );
  }
}
