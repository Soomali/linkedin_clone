part of 'post.dart';

class PostReactionsArea extends StatelessWidget {
  const PostReactionsArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Post post = PostHolder.of(context)!.post;
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.overline?.copyWith(
              color: Colors.grey,
              letterSpacing: 0.6,
              fontSize:
                  (Theme.of(context).textTheme.overline?.fontSize ?? 12) + 2) ??
          TextStyle(color: Colors.grey, fontSize: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: post.reactionCount == 0 ? Container() : PostReactions()),
          if (post.sharedCount != 0 || post.commentCount != 0) PostMetadata()
        ],
      ),
    );
  }
}
