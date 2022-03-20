part of 'conversation_page.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  final Message? messageBefore;
  const MessageWidget({Key? key, required this.message, this.messageBefore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLeft = message.type == MessageType.received;
    final double leftPadding = isLeft ? 16 : 8;
    final double rightPadding = isLeft ? 8 : 16;
    return CustomPaint(
      painter: MessagePainter(message: message, messageBefore: messageBefore),
      child: Align(
        alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width * 0.7),
          child: Container(
              decoration: BoxDecoration(
                  color: isLeft
                      ? const Color.fromARGB(255, 48, 58, 56)
                      : const Color.fromARGB(255, 10, 105, 85),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              padding: EdgeInsets.fromLTRB(8, 6, 8, 12),
              margin: EdgeInsets.fromLTRB(leftPadding, 0, rightPadding, 0),
              child: MessageContent(message: message)),
        ),
      ),
    );
  }
}

class MessagePainter extends CustomPainter {
  final Message message;
  final Message? messageBefore;

  MessagePainter({required this.message, this.messageBefore});

  @override
  void paint(Canvas canvas, Size size) {
    if (message.type == messageBefore?.type) {
      return;
    }
    final path = Path();
    final paint = Paint();
    switch (message.type) {
      case MessageType.sent:
        path.moveTo(size.width - 8, 0);
        path.lineTo(size.width - 24, 0);
        path.lineTo(size.width - 24, 24);
        paint.color = const Color.fromARGB(255, 10, 105, 85);

        break;
      case MessageType.received:
        path.moveTo(8, 0);
        path.lineTo(24, 0);
        path.lineTo(24, 24);
        paint.color = const Color.fromARGB(255, 48, 58, 56);
        break;
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
