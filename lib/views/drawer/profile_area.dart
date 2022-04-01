part of 'custom_drawer.dart';

const _photoUrl =
    'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FZvykuekSqoZt3580r94Wdq1jrdz2-arKqPB70C4WteNrAHh5K-763000000?alt=media&token=2923c7fe-a6f7-4cbe-a985-a7a1ee352823';

class ProfileArea extends StatelessWidget {
  const ProfileArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      tileColor: LinkedInDarkColors.listTileBackgroundColor,
      leading: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.05,
        backgroundImage: const NetworkImage(_photoUrl),
      ),
      title: Text(
        'Mehmet Ali Günaydın',
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: const ProfileTileSubtitle(),
      trailing: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            color: Theme.of(context).iconTheme.color,
          )),
    );
  }
}

class ProfileTileSubtitle extends StatelessWidget {
  const ProfileTileSubtitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.subtitle1 ??
          const TextStyle(color: Colors.blue),
      child: Row(
        children: [
          const Text('Profili görüntüle'),
          SizedBox(
            width: size.width * 0.015,
          ),
          Icon(
            Icons.circle,
            size: size.width * 0.02,
          ),
          SizedBox(
            width: size.width * 0.015,
          ),
          Text('Ayarlar')
        ],
      ),
    );
  }
}
