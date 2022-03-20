part of 'conversation_page.dart';

class ConversationAppBarPopUp extends StatelessWidget {
  const ConversationAppBarPopUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //popUp menüsü icon olarak verdiğimiz widget'a tıklandığı zaman o widget'ın altına itemBuilder
    //ile tanımlanmış PopUpMenuItem lar'ı build eder.
    return PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.more_vert),
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
                value: 'kişiyiGörüntüle', child: Text('Kişiyi Görüntüle')),
            const PopupMenuItem(
                value: 'medya', child: Text('Medya,bağlantılar ve belgeler')),
            const PopupMenuItem(value: 'ara', child: Text('Ara')),
            const PopupMenuItem(
                value: 'Bildirimleri sessize al',
                child: Text('Bildirimleri sessize al')),
            const PopupMenuItem(
                value: 'Duvar Kağıdı', child: Text('Duvar Kağıdı')),
            PopupMenuItem(
                value: 'Diğer',
                child: Row(
                  children: const [
                    Expanded(
                        child: Text(
                      'Diğer',
                    )),
                    Icon(Icons.arrow_right_rounded)
                  ],
                )),
          ];
        });
  }
}
