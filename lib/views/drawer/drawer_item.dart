part of 'custom_drawer.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  const DrawerItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
      child: Text(
        text,
        style: textTheme.headline6?.apply(color: textTheme.subtitle1?.color),
      ),
    );
  }
}
