part of 'post.dart';

class PostReactions extends StatelessWidget {
  const PostReactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = PostHolder.of(context)!.post;
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.016;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.08,
          height: 30,
          child: ReactionIconStack(padding: padding),
        ),
        if (post.reactedNetwork.isNotEmpty)
          Text(
              '${post.reactedNetwork.first.userName} ve ${post.reactionCount - 1} kişi daha'),
        if (post.reactedNetwork.isEmpty) Text('${post.reactionCount}')
      ],
    );
  }
}

class ReactionIconStack extends StatelessWidget {
  const ReactionIconStack({
    Key? key,
    required this.padding,
  }) : super(key: key);

  final double padding;

  @override
  Widget build(BuildContext context) {
    final post = PostHolder.of(context)!.post;
    return Stack(
      children: [
        ...List.generate(post.reactions.length > 3 ? 3 : post.reactions.length,
            (index) {
          final IconData icon;
          final Color backgroundColor;
          switch (post.reactions[index].reaction) {
            case ReactionType.like:
              icon = Icons.thumb_up;
              backgroundColor = Colors.blue;
              break;
            case ReactionType.congrats:
              icon = Icons.handshake;
              backgroundColor = Colors.amber;
              break;
            case ReactionType.help:
              icon = Icons.help;
              backgroundColor = Colors.white;
              break;
            case ReactionType.love:
              icon = Icons.favorite;
              backgroundColor = Colors.red;
              break;
            case ReactionType.information:
              icon = Icons.info;
              backgroundColor = Colors.yellow;
              break;
            case ReactionType.hmm:
              icon = Icons.bubble_chart;
              backgroundColor = Colors.green;
              break;
          }

          return Positioned(
              child: ReactionIcon(
                icon: icon,
                backgroundColor: backgroundColor,
              ),
              top: MediaQuery.of(context).size.height * 0.01,
              left: index == 0 ? 0 : (padding * index));
        })
      ],
    );
  }
}

class ReactionIcon extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  const ReactionIcon({Key? key, required this.icon, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: CircleBorder(
              side: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 1)),
          color: backgroundColor ?? Theme.of(context).iconTheme.color),
      child: Icon(
        icon,
        size: 12,
      ),
    );
  }
}
