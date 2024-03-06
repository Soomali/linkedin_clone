part of 'data.dart';

enum ReactionType { like, congrats, help, love, information, hmm }

class Reaction {
  final ReactionType reaction;

  final User user;
  Reaction({required this.user, required this.reaction});
  factory Reaction.random() {
    final type =
        ReactionType.values[_random.nextInt(ReactionType.values.length)];
    return Reaction(user: User.random(), reaction: type);
  }
}
