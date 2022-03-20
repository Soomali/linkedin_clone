import 'package:flutter/material.dart';

class NormalAppBarPopUp extends StatelessWidget {
  const NormalAppBarPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        icon: Icon(Icons.more_vert),
        itemBuilder: (context) => const [
              PopupMenuItem(value: 'grup', child: Text('Yeni Grup')),
              PopupMenuItem(value: 'toplu', child: Text('Yeni toplu mesaj')),
              PopupMenuItem(value: 'bağlı', child: Text('Bağlı cihazlar')),
              PopupMenuItem(
                  value: 'yıldızlı', child: Text('Yıldızlı mesajlar')),
              PopupMenuItem(value: 'ayarlar', child: Text('Ayarlar')),
            ]);
  }
}
