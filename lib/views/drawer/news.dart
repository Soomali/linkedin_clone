part of 'custom_drawer.dart';

class News extends StatelessWidget {
  //events may be added to show under News section, I won't be adding them though.
  final List<String>? _events;
  const News({Key? key, List<String>? events})
      : _events = events,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'En Yeni',
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}
