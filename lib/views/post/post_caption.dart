part of 'post.dart';

class PostCaption extends StatefulWidget {
  const PostCaption({Key? key}) : super(key: key);

  @override
  State<PostCaption> createState() => _PostCaptionState();
}

class _PostCaptionState extends State<PostCaption> {
  late Post _post;
  late String _text;
  bool _isExpanded = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _post = PostHolder.of(context)!.post;
    _text = _post.caption;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
            style: Theme.of(context).textTheme.overline?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                letterSpacing: 1),
            text: _text,
            children: [
              if (_post.fullCaption.length > 123 && !_isExpanded)
                TextSpan(
                    text: ' Daha fazla gör',
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        ?.copyWith(color: Colors.grey),
                    recognizer: TapGestureRecognizer()
                      ..onTap = (() {
                        setState(() {
                          _text = _post.fullCaption;
                          _isExpanded = true;
                        });
                      }))
            ]));
  }
}
