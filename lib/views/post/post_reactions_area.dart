part of 'post.dart';

class PostReactionsArea extends StatelessWidget {
  const PostReactionsArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [PostReactions(), PostMetadata()],
    );
  }
}
