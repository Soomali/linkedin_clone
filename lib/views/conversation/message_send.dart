part of 'conversation_page.dart';

class MessageSendWidget extends StatefulWidget {
  final void Function(String) onSend;

  const MessageSendWidget({Key? key, required this.onSend}) : super(key: key);

  @override
  State<MessageSendWidget> createState() => _MessageSendWidgetState();
}

class _MessageSendWidgetState extends State<MessageSendWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 48, 58, 56),
                contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 4),
                hintText: 'Bir şeyler yaz..',
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(32))),
                prefixIcon: IconButton(
                    onPressed: () => print('Emoji'), icon: Icon(Icons.face)),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () => 'kamera',
                        icon: Icon(Icons.camera_alt)),
                    IconButton(
                        onPressed: () => 'Dosya',
                        icon: Icon(Icons.attach_file)),
                  ],
                )),
          ),
        ),
        SendIcon(
          controller: controller,
          onSend: widget.onSend,
        )
      ],
    );
  }
}

class SendIcon extends StatefulWidget {
  final void Function(String) onSend;
  final TextEditingController controller;
  const SendIcon({Key? key, required this.controller, required this.onSend})
      : super(key: key);

  @override
  State<SendIcon> createState() => _SendIconState();
}

class _SendIconState extends State<SendIcon> {
  var isEmpty = true;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.text.isEmpty && !isEmpty) {
        setState(() {
          isEmpty = true;
        });
      } else if (widget.controller.text.isNotEmpty && isEmpty) {
        setState(() {
          isEmpty = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: EdgeInsets.zero,
      decoration: const ShapeDecoration(
          shape: CircleBorder(), color: Color.fromARGB(255, 65, 158, 118)),
      child: IconButton(
        onPressed: () {
          if (isEmpty) {
            print('recording video..');
          } else {
            widget.onSend(widget.controller.text);
            widget.controller.text = '';
            setState(() {
              isEmpty = true;
            });
          }
        },
        icon: Icon(
          isEmpty ? Icons.mic : Icons.send,
          size: 24,
        ),
      ),
    );
  }
}
