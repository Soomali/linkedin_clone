part of 'post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostHolder(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostHeaderWrapper(
                  child: post.reactedNetwork.isNotEmpty
                      ? const PostCommonNetwork()
                      : const PostUserData()),
              if (post.reactedNetwork.isNotEmpty) const PostUserData(),
              const PostCaption(),
              if (post.photoUrl != null) const PostImage(),
              const SizedBox(
                height: 8,
              ),
              if (post.reactions.isNotEmpty) const PostReactionsArea(),
              const PostOptions(),
            ],
          ),
        ),
        post: post);
  }
}
