part of 'data.dart';

enum _NotificationType {
  newPost,
  newPosition,
  newNetwork,
  commentToPost,
  forYou
}

class NotificationData {
  NotificationData._(
      {required this.user,
      this.about,
      required String caption,
      required _NotificationType type})
      : _caption = caption,
        _type = type;

  factory NotificationData.random() {
    final type = _NotificationType
        .values[_random.nextInt(_NotificationType.values.length)];

    User? about;
    if (type == _NotificationType.commentToPost ||
        type == _NotificationType.newPosition) {
      about = User.random();
    }

    return NotificationData._(
        user: User.random(),
        about: about,
        caption: _randoCaption.substring(0, _random.nextInt(40)),
        type: type);
  }

  String? get actionButtonText {
    switch (_type) {
      case _NotificationType.newNetwork:
        return 'Ağını genişlet';
      case _NotificationType.newPosition:
        return 'Tebrik edin';
      default:
        return null;
    }
  }

  String get captionText {
    switch (_type) {
      case _NotificationType.newPost:
        return ' Yeni bir gönderi paylaştı:$_caption';
      case _NotificationType.newPosition:
        return ' şirketinde çok aşırı havalı ve iyi maaşlı işçi pozisyonunda işe başladı';

      case _NotificationType.newNetwork:
        return ' iki yeni bağlantı kurdu.Kulannıcının tüm bağlantılarını gör.';
      case _NotificationType.commentToPost:
        return ' adlı kulannıcının gönderisi için  yorum yaptı';
      case _NotificationType.forYou:
        return ' ilginizi çekebilecek bir gönderi paylaştı';
    }
  }

  String? get prefixText {
    if (_type == _NotificationType.forYou) {
      return 'Yeni Bağlantınız ';
    }
    return null;
  }

  final User user;
  final User? about;
  final String _caption;
  final _NotificationType _type;
}
