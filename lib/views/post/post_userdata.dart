part of 'post.dart';

class PostUserData extends StatelessWidget {
  const PostUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = PostHolder.of(context)!.post;
    final parentTheme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      leading: CircleAvatar(backgroundImage: NetworkImage(post.photoUrl ?? '')),
      minLeadingWidth: 56,
      horizontalTitleGap: 2,
      title: IconTheme(
        data: parentTheme.iconTheme.copyWith(size: 8),
        child: DefaultTextStyle(
          style: parentTheme.textTheme.overline
                  ?.copyWith(color: Colors.grey, letterSpacing: 0.2) ??
              const TextStyle(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle(
                style: parentTheme.textTheme.subtitle2
                        ?.copyWith(color: parentTheme.colorScheme.secondary) ??
                    TextStyle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(post.poster.userName),
                    const Icon(Icons.circle),
                    const Text('2'),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                post.poster.position,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: const [
                  Text('6 saat'),
                  Icon(Icons.circle),
                  Icon(Icons.cloud_circle_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
