part of 'conversation_page.dart';

class MessageContent extends StatelessWidget {
  const MessageContent({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.end,
      children: [
        Text(
          message.literalMessage,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3.2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.check,
                size: 12,
                color: Colors.grey.shade500,
              ),
              Text('${message.time.hour}:${message.time.minute}',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12))
            ],
          ),
        ),
      ],
    );
  }
}
