part of 'conversation.dart';

class DateWidget extends StatelessWidget {
  final Message message;
  const DateWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = message.time;
    final now = DateTime.now();
    final messageWasToday = now.day == time.day;
    return DefaultTextStyle(
      style: TextStyle(color: Colors.grey.shade500),
      child: messageWasToday
          ? Text('${time.hour}.${time.minute}')
          : message.timeAgo > 0
              ? Text('${message.timeAgo}')
              : const Text('Dün'),
    );
  }
}
