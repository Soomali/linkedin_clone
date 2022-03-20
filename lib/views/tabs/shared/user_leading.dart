import 'package:flutter/material.dart';
import 'package:flutter_app_clone/data/conversation_models.dart';

class UserListLeading extends StatelessWidget {
  final double radius;
  final VoidCallback? onTap;
  const UserListLeading(
      {Key? key, required this.user, this.radius = 24, this.onTap})
      : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(
        radius: radius, backgroundImage: NetworkImage(user.photoUrl));
    return onTap != null
        ? GestureDetector(
            onTap: onTap,
            child: avatar,
          )
        : avatar;
  }
}
