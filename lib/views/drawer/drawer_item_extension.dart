part of 'custom_drawer.dart';

class DrawerItemExtension extends StatelessWidget {
  final String _text;
  final Widget? icon;
  final TextStyle? style;
  const DrawerItemExtension({Key? key, String? text, this.icon, this.style})
      : _text = text ?? 'Etkinlik oluştur',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: MediaQuery.of(context).size.width * 0.08,
      horizontalTitleGap: 0,
      leading: icon,
      title: Text(
        _text,
        style: style ?? Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
