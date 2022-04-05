import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clone/views/appBar/app_bar.dart';
import '../../data/data.dart';
part 'inherited_post.dart';
part 'post_layout.dart';
part 'post_caption.dart';
part 'post_common_network.dart';
part 'post_image.dart';
part 'post_reaction.dart';
part 'post_metadata.dart';
part 'post_options.dart';
part 'post_userdata.dart';
part 'post_reactions_area.dart';
part 'post_header_wrapper.dart';

class PostPage extends StatelessWidget {
  final List<Post> posts;
  const PostPage({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const LinkedInAppBar(),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return PostWidget(post: posts[index]);
        }, childCount: posts.length)),
      ],
    );
  }
}
