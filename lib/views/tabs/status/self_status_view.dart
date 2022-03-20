part of 'status.dart';

class SelfStatusWidget extends StatelessWidget {
  final Status status;
  const SelfStatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(8, 12, 12, 8),
      leading: Stack(
        children: [
          StatusView(
            radius: 24,
            strokeWidth: 2,
            centerImageUrl: status.user.photoUrl,
            numberOfStatus: status.count,
            indexOfSeenStatus: status.seen,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: const ShapeDecoration(
                  shape: CircleBorder(), color: Colors.green),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 16,
              ),
            ),
          )
        ],
      ),
      horizontalTitleGap: 4,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status.user.name,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
          Text(
            'Durum eklemek için tıklayın',
            style: TextStyle(color: Colors.grey.shade500),
          )
        ],
      ),
    );
  }
}
