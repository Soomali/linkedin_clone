part of 'notification_page.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationData notification;
  const NotificationWidget({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(24, 32, 16, 8),
      minLeadingWidth: 0,
      horizontalTitleGap: 12,
      leading: const CustomAvatar(
        radius: 56,
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: RichText(
                  text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Colors.grey),
                      text: notification.prefixText,
                      children: [
                TextSpan(
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                    children: [
                      TextSpan(text: notification.user.userName),
                      if (notification.about != null)
                        TextSpan(text: ',${notification.about!.userName}')
                    ]),
                TextSpan(text: notification.captionText)
              ]))),
          SizedBox(
            height: 12,
          ),
          if (notification.actionButtonText != null)
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    primary: Colors.blue,
                    textStyle: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: Colors.blue),
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue, width: 1.2))),
                onPressed: () {},
                child: Text(notification.actionButtonText!))
        ],
      ),
      trailing: Column(
        children: const [Text('2d'), Icon(Icons.more_vert)],
      ),
    );
  }
}
