part of 'post.dart';

class PostCommonNetwork extends StatelessWidget {
  const PostCommonNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Post post = PostHolder.of(context)!.post;
    final Size size = MediaQuery.of(context).size;
    final shouldCut = post.reactedNetwork.length >= 2;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.06 * (post.reactedNetwork.length > 1 ? 2 : 1),
            height: size.width * 0.06,
            child: Stack(alignment: AlignmentDirectional.center, children: [
              ...List<Widget>.generate(
                  shouldCut ? 2 : 1,
                  (index) => Positioned(
                        left: index * size.width * 0.03,
                        child: CustomAvatar(
                          radius: size.width * 0.06,
                        ),
                      ))
            ]),
          ),
          SizedBox(
            width: post.reactedNetwork.length < 2 ? (size.width * 0.03) + 4 : 4,
          ),
          Flexible(
            child: RichText(
                text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              children: [
                ...List.generate(
                    post.reactedNetwork.length > 2
                        ? 3
                        : post.reactedNetwork.length,
                    (index) => TextSpan(
                        text: index > 1
                            ? ' ve ${post.reactedNetwork.length - 2} diğer bağlantı'
                            : index == 0 && post.reactedNetwork.length > 1
                                ? '${post.reactedNetwork[index].userName},'
                                : post.reactedNetwork[index].userName)),
                const TextSpan(text: ' bunu beğendi')
              ],
            )),
          )
        ],
      ),
    );
  }
}
