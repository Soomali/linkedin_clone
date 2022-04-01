part of 'data.dart';

final _caption = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum non mi ut consectetur. Maecenas aliquet lorem sapien, in aliquam leo interdum non. Nulla non ex accumsan, blandit dolor ac, semper massa. Cras egestas diam vitae ornare laoreet. Vestibulum euismod quam consectetur lobortis gravida. Ut vel mollis nulla. Aliquam erat volutpat. Duis tristique eleifend dolor porta pharetra. Phasellus luctus neque vel lacus feugiat laoreet. Pellentesque congue vulputate ultrices. Aliquam lectus lectus, sollicitudin ut iaculis sed, facilisis id dui. Praesent vitae nibh porttitor, rutrum lacus et, blandit leo. Praesent bibendum malesuada mattis. Fusce pharetra ante eget vulputate iaculis. Vivamus dignissim varius egestas. Vestibulum pharetra ex at nulla sodales, sed ullamcorper metus ornare.

Ut porttitor id nisl a tempor. Nunc sed nisi a eros accumsan consequat vitae ut quam. Nullam faucibus convallis libero, vel auctor est condimentum sit amet. Pellentesque eleifend lorem a mi convallis, non vestibulum diam tempor. Donec et tincidunt massa, non vulputate orci. Mauris malesuada nulla eget tempus faucibus. Duis dictum purus non varius sodales. Phasellus blandit, augue quis fermentum efficitur, est odio posuere ipsum, id sagittis purus erat ullamcorper sapien. Mauris urna mi, auctor sit amet tortor vel, tempus mattis ante. Cras at lacus posuere, bibendum sem non, blandit velit. Quisque convallis sed dolor quis pulvinar. Praesent placerat sem vestibulum quam ornare lacinia. Suspendisse sed iaculis ipsum, nec condimentum mi. Suspendisse faucibus diam sed volutpat elementum. Phasellus nec auctor neque.

Donec a sodales augue. Cras rutrum, enim et faucibus feugiat, nisl elit pretium justo, ut mollis ligula eros eu metus. Quisque laoreet sed lorem ac consequat. Morbi ultrices erat nec magna malesuada, a porttitor ligula convallis. Integer placerat purus leo, sed fringilla odio porttitor at. Morbi tincidunt dignissim nibh id tempor. Quisque eget euismod metus, id iaculis nulla. Duis egestas quis est quis semper. In porta lectus ut quam tristique iaculis. Nunc id mauris ac turpis sodales dignissim nec eget turpis. In tempor finibus elementum. Praesent tempor fermentum leo, a dignissim ex bibendum non. Pellentesque sodales, eros eu ultrices semper, augue libero consectetur nisi, a egestas nisl urna finibus arcu. Ut tristique purus a nulla tincidunt, et maximus est iaculis. Vestibulum a luctus mauris. Phasellus consequat blandit ipsum vitae efficitur.

Etiam nisi libero, sodales sed placerat ut, placerat eu odio. Vivamus vitae nibh ligula. Ut eu mauris erat. Nulla id volutpat risus, finibus ultricies dui. Nam ut neque dapibus nibh pellentesque pellentesque in sed leo. Pellentesque congue faucibus pulvinar. Aliquam pellentesque purus velit, non finibus nisl euismod in. Aliquam eu vulputate ante. Nulla purus orci, feugiat vitae accumsan ac, tincidunt vitae urna. Sed posuere laoreet urna, id gravida libero tincidunt non. In dapibus pellentesque risus a commodo. Cras lobortis lorem eu felis hendrerit ornare.

Vivamus tempus interdum lacinia. Praesent mi quam, sodales a suscipit ac, pulvinar vitae lorem. Morbi auctor dignissim nisi, et dictum mi commodo aliquet. Proin at tortor lorem. Sed libero lorem, aliquam non luctus eu, varius nec purus. Morbi volutpat, tellus quis imperdiet vehicula, urna erat auctor odio, nec semper ex arcu at ligula. Nam ultricies tincidunt turpis eu ornare. Morbi pulvinar maximus odio, sit amet commodo neque tempor quis. Quisque at interdum elit. Suspendisse eu volutpat justo. Vestibulum malesuada imperdiet purus, vitae viverra risus ultrices ut. Curabitur non lorem feugiat, lacinia lacus sit amet, fringilla nulla. Vivamus sit amet lacinia sapien. Praesent mauris neque, varius sed vehicula a, pretium sit amet velit. Sed nec enim lorem.

''';

class Post {
  final List<User> reactedNetwork;
  final User poster;
  final DateTime postDate;
  final String caption;
  final String? photoUrl;
  final List<Reaction> reactions;
  final int reactionCount;
  final int commentCount;
  final int sharedCount;

  Post(
      {required this.reactedNetwork,
      required this.poster,
      required this.postDate,
      required this.caption,
      this.photoUrl,
      required this.reactions,
      required this.reactionCount,
      required this.commentCount,
      required this.sharedCount});

  factory Post.random() {
    final postDate =
        DateTime.now().subtract(Duration(days: _random.nextInt(20) + 1));
    return Post(
        reactedNetwork: List.generate(
          _random.nextInt(3) + 1,
          (index) => User.random(),
        ),
        poster: User.random(),
        postDate: postDate,
        photoUrl: _random.nextBool()
            ? _photoUrls[_random.nextInt(_photoUrls.length)]
            : null,
        reactions: List.generate(
            _random.nextInt(32) + 1, (index) => Reaction.random()),
        commentCount: _random.nextInt(50) + 1,
        sharedCount: _random.nextInt(10) + 1,
        reactionCount: _random.nextInt(48) + 6,
        caption: _caption.substring(0, _random.nextInt(540) + 21));
  }
}
