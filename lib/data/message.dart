part of 'conversation_models.dart';

enum MessageStatus { sending, sent, received, read }

enum MessageType { sent, received }

const _messages = [
  'Merhaba',
  'Nasılsın',
  'Aklıma takıldıda bugün derste böyle bişi işlemiş miydik Aklıma takıldıda bugün derste böyle bişi işlemiş miydik Aklıma takıldıda bugün derste böyle bişi işlemiş miydik Aklıma takıldıda bugün derste böyle bişi işlemiş miydik Aklıma takıldıda bugün derste böyle bişi işlemiş miydik Aklıma takıldıda bugün derste böyle bişi işlemiş miydik Aklıma takıldıda bugün derste böyle bişi işlemiş miydik Aklıma takıldıda bugün derste böyle bişi işlemiş miydik Aklıma takıldıda bugün derste böyle bişi işlemiş miydik Aklıma takıldıda bugün derste böyle bişi işlemiş miydik Aklıma takıldıda bugün derste böyle bişi işlemiş miydik Aklıma takıldıda bugün derste böyle bişi işlemiş miydik',
  'görüşürüz',
  'Tamamdır haberleşelim',
  'aylık 5000 tl artı yemek artı yol'
];

final Random _random = Random();

class Message {
  final MessageStatus status;
  final String _message;
  final DateTime time;
  final int timeAgo;
  final MessageType type;
  String get literalMessage => _message;
  String get message {
    return _message.length > 40 ? '${_message.substring(0, 40)}...' : _message;
  }

  Message(
      {required String message,
      required this.status,
      required this.time,
      required this.type})
      : timeAgo = time.difference(DateTime.now()).inDays,
        _message = message;

  Message copyWith(
          {MessageStatus? status,
          String? message,
          DateTime? time,
          MessageType? type}) =>
      Message(
          message: message ?? _message,
          status: status ?? this.status,
          time: time ?? this.time,
          type: type ?? this.type);

  static Message random() {
    final message = _messages[_random.nextInt(_messages.length)];
    final status = MessageStatus.values[_random.nextInt(4)];
    final time =
        DateTime.now().subtract(Duration(minutes: _random.nextInt(1600000)));
    return Message(
        message: message,
        status: status,
        time: time,
        type: MessageType.values[_random.nextInt(2)]);
  }
}
