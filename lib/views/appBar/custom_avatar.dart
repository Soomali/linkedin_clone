part of 'app_bar.dart';

const _photoUrl =
    'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FZvykuekSqoZt3580r94Wdq1jrdz2-arKqPB70C4WteNrAHh5K-763000000?alt=media&token=2923c7fe-a6f7-4cbe-a985-a7a1ee352823';

class CustomAvatar extends StatelessWidget {
  final double? radius;
  const CustomAvatar({Key? key, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Container(
          width: radius,
          height: radius,
          decoration: const ShapeDecoration(
            shape:
                CircleBorder(side: BorderSide(color: Colors.white, width: 1.6)),
            image: DecorationImage(
                image: NetworkImage(
                  _photoUrl,
                ),
                fit: BoxFit.fill),
          )),
    );
  }
}
