part of 'conversation_models.dart';

class Status {
  final User user;
  final int count;
  final int seen;
  Status({required this.user, required this.count, required this.seen});

  factory Status.random() {
    final count = 1 + _random.nextInt(5);
    final seen = _random.nextInt(count);
    return Status(
        count: 1 + _random.nextInt(5), user: User.random(), seen: seen);
  }
  Status copyWith({User? user, int? count, int? seen}) {
    if (seen != null && seen > this.count) {
      return this;
    }
    return Status(
        user: user ?? this.user,
        count: count ?? this.count,
        seen: seen ?? this.seen);
  }
}
