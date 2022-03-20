part of 'conversation.dart';

class UserImagePopUp extends PopupRoute<void> {
  final User user;
  UserImagePopUp(this.user);
  @override
  Color? get barrierColor => Colors.black87;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData(
          iconTheme: IconThemeData(color: Colors.green.shade400, size: 32)),
      child: FadeTransition(
          opacity: animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ImageWidget(user: user), IconsWidget()],
          )),
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
}

class IconsWidget extends StatelessWidget {
  const IconsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(4, 8, 4, 4),
      width: size.width * .56,
      color: Colors.blueGrey.shade900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.call,
          ),
          Icon(
            Icons.message,
            size: 32,
          ),
          Icon(Icons.videocam),
          Icon(Icons.info_outline)
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.56,
      height: size.height * 0.27,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
              image: NetworkImage(user.photoUrl), fit: BoxFit.fill)),
      child: Align(
          alignment: const Alignment(0, -1.01),
          child: SizedBox(
            width: size.width * .56,
            child: Material(
              shadowColor: Color.fromRGBO(0, 0, 0, .2),
              color: const Color.fromRGBO(0, 0, 0, .8),
              child: Text(
                user.name,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          )),
    );
  }
}
