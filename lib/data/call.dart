part of 'conversation_models.dart';

enum CallType { phone, video }

class Call {
  final User user;
  final DateTime time;
  final bool isIncoming;
  final bool isAnswered;
  final CallType callType;

  Call(
      {required this.user,
      required this.time,
      required this.isIncoming,
      required this.isAnswered,
      required this.callType});

  factory Call.random() {
    return Call(
        user: User.random(),
        time: DateTime.now()
            .subtract(Duration(minutes: 100 + _random.nextInt(50000))),
        isAnswered: _random.nextBool(),
        isIncoming: _random.nextBool(),
        callType: CallType.values[_random.nextInt(2)]);
  }

  Call copyWith(
      {User? user,
      DateTime? time,
      bool? isIncoming,
      bool? isAnswered,
      CallType? callType}) {
    return Call(
        user: user ?? this.user,
        time: time ?? this.time,
        isIncoming: isIncoming ?? this.isIncoming,
        isAnswered: isAnswered ?? this.isAnswered,
        callType: callType ?? this.callType);
  }
}
