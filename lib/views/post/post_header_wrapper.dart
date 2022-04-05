part of 'post.dart';

class PostHeaderWrapper extends StatelessWidget {
  final Widget child;

  const PostHeaderWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: child,
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
