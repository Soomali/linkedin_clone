part of 'post.dart';

class PostHolder extends InheritedWidget {
  final Post post;
  const PostHolder({Key? key, required this.child, required this.post})
      : super(key: key, child: child);

  final Widget child;

  static PostHolder? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PostHolder>();
  }

  @override
  bool updateShouldNotify(PostHolder oldWidget) {
    return true;
  }
}
