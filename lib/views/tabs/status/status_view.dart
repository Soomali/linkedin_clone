part of 'status.dart';

class StatusWidget extends StatelessWidget {
  final Status status;
  const StatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(8, 12, 12, 8),
      leading: StatusWidgetTitle(status: status),
      horizontalTitleGap: 4,
      title: Text(
        status.user.name,
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
    );
  }
}

class StatusWidgetTitle extends StatefulWidget {
  const StatusWidgetTitle({
    Key? key,
    required this.status,
  }) : super(key: key);

  final Status status;

  @override
  State<StatusWidgetTitle> createState() => _StatusWidgetTitleState();
}

class _StatusWidgetTitleState extends State<StatusWidgetTitle> {
  late Status status;
  @override
  void initState() {
    super.initState();
    status = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          status = status.copyWith(seen: status.seen + 1);
        });
      },
      child: StatusView(
        radius: 24,
        strokeWidth: 2,
        centerImageUrl: status.user.photoUrl,
        numberOfStatus: status.count,
        indexOfSeenStatus: status.seen,
      ),
    );
  }
}
