part of 'calls.dart';

class CallListTile extends StatelessWidget {
  final Call call;
  const CallListTile({Key? key, required this.call}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(8, 12, 12, 8),
      horizontalTitleGap: 12,
      leading: UserListLeading(user: call.user),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            call.user.name,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
          Row(
            children: [
              Transform.rotate(
                  angle: call.isIncoming ? 3 * (pi / 4) : -pi / 4,
                  child: Icon(
                    Icons.arrow_right_alt,
                    color: call.isAnswered ? Colors.green : Colors.red,
                    size: 24,
                  )),
              Text(call.time.toIso8601String().substring(0, 18))
            ],
          ),
        ],
      ),
      trailing: call.callType == CallType.phone
          ? const Icon(
              Icons.phone,
              color: Colors.green,
              size: 24,
            )
          : const Icon(
              Icons.videocam,
              color: Colors.green,
              size: 24,
            ),
    );
  }
}
