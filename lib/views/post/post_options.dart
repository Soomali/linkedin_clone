part of 'post.dart';

class PostOptions extends StatelessWidget {
  const PostOptions({Key? key}) : super(key: key);
  static const EdgeInsets iconButtonPadding = EdgeInsets.fromLTRB(0, 4, 0, 4);
  @override
  Widget build(BuildContext context) {
    final emptyFunction = () {};
    return IconTheme(
      data: Theme.of(context).iconTheme.copyWith(size: 16),
      child: DefaultTextStyle(
        style: Theme.of(context)
            .textTheme
            .overline!
            .copyWith(color: Colors.grey, letterSpacing: 0.6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PostOptionLayout(
              top: Padding(
                padding: iconButtonPadding,
                child: Icon(Icons.thumb_up_alt_outlined),
              ),
              bottom: Text('Beğen'),
            ),
            const PostOptionLayout(
              bottom: Text('Yorum Yap'),
              top: Padding(
                  padding: iconButtonPadding, child: Icon(Icons.comment)),
            ),
            const PostOptionLayout(
              bottom: Text('Paylaş'),
              top: Padding(
                  padding: iconButtonPadding,
                  child: Icon(Icons.turn_slight_right_outlined)),
            ),
            PostOptionLayout(
              bottom: Text('Gönder'),
              top: Transform.rotate(
                angle: -0.8,
                child: const Padding(
                    padding: iconButtonPadding, child: Icon(Icons.send_sharp)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PostOptionLayout extends StatelessWidget {
  final Widget top;
  final Widget bottom;
  const PostOptionLayout({Key? key, required this.top, required this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [top, bottom],
    );
  }
}
