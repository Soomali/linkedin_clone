part of 'post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostHolder(
        child: Column(
          children: [
            if (!post.reactedNetwork.isEmpty) PostCommonNetwork(),
            PostUserData(),
            PostCaption(),
            if (post.photoUrl != null) PostImage(),
            PostReactionsArea(),
            PostOptions(),
          ],
        ),
        post: post);
  }
}
