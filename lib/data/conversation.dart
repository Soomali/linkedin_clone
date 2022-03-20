part of 'conversation_models.dart';

class Conversation {
  final List<Message> messages;
  final User user;
  final bool pinned;

  Conversation(
      {required this.messages, required this.user, required this.pinned});
  Conversation copyWith({List<Message>? messages, User? user, bool? pinned}) =>
      Conversation(
          messages: messages ?? this.messages,
          user: user ?? this.user,
          pinned: pinned ?? this.pinned);
  Conversation.random(int size)
      : messages = List.generate(size, (index) => Message.random()),
        user = User.random(),
        pinned = _random.nextBool();
}
