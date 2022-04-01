part of 'custom_drawer.dart';

class TryPremium extends StatelessWidget {
  const TryPremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: LinkedInDarkColors.listTileBackgroundColor,
      horizontalTitleGap: 4,
      leading: const Icon(
        Icons.contrast,
        color: Colors.amber,
      ),
      title: Text(
        'Premium\'u ücretsiz deneyin',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
