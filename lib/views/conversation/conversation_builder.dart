part of 'conversation_page.dart';

class ConversationBuilder extends StatefulWidget {
  final List<Message> messages;

  const ConversationBuilder({Key? key, required this.messages})
      : super(key: key);

  @override
  State<ConversationBuilder> createState() => _ConversationBuilderState();
}

class _ConversationBuilderState extends State<ConversationBuilder> {
  var messages = <Message>[];
  //controllerlar (ScrollController,TextEditingController gibi) belirli widget'lara verebileceğiniz
  //ve o widget'ın durumunu kontrol edebileceğiniz sınıflardır.Burada mesaj geldiğinde listenin en aşağı kısma
  //ilerlemesi için kullandım.
  final ScrollController _controller = ScrollController();

  //build metodundan önce çağrılır
  @override
  void initState() {
    super.initState();
    messages = widget.messages;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Column içinde ListView kullanmak için ListView'i Expanded ile sarmamız gerekir.
        //bir bakıma flutter'a bu liste olabildiğince  yer kaplasın diyoruz.
        Expanded(
          child: ListView.separated(
              //reverse parametresi listenin aşağıdan yukarı olacak şekilde sıralanmasına olanak sağlar,
              //yani en alttan başlarız
              reverse: true,
              controller: _controller,
              padding: const EdgeInsets.symmetric(vertical: 8),
              //her itemBuilder widget'ından sonra seperatorBuilder widget'ı build edilir yani
              //widgetlarımız şu şekilde gözükür: [ItemBuilder][Seperator][ItemBuilder][Seperator][ItemBuilder]
              separatorBuilder: (context, index) {
                //mesajlar arası 20 piksellik boşluk için
                return const SizedBox(
                  height: 20,
                );
              },
              //elimizdeki mesajlar kadar widget build edeceğiz.
              itemCount: widget.messages.length,
              itemBuilder: (context, index) {
                //bir mesaj widget'ı oluşturur. listeyi tersten dolaşarak mesajların doğru yerde olması
                //sağlanıyor.
                return MessageWidget(
                  message: widget.messages[messages.length - index - 1],
                  messageBefore: index == messages.length - 1
                      ? null
                      : widget.messages[messages.length - index - 2],
                );
              }),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: MessageSendWidget(
            onSend: (text) {
              //mesajlara yeni mesajı ekleyip, listView'ı yeniden oluşturuyoruz.
              //bu işlem sonucu listView ekranda gözüken her bir widget'ı yeniden oluşturuyor.
              //yeni mesajı mesajlara eklediğimiz içinde listview yeni mesajımızı da yeri geldiğinde
              //oluşturmaya devam ediyor
              setState(() {
                messages.add(Message(
                  message: text,
                  status: MessageStatus.sending,
                  time: DateTime.now(),
                  type: MessageType.sent,
                ));
              });
              //yeni mesaj eklediği zaman listenin ekranın başına gidiyoruz
              _controller.jumpTo(0.0);
            },
          ),
        )
      ],
    );
  }
}
