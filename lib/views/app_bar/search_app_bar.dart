import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'icon_action_chip.dart';

class SearchAppBar extends StatelessWidget {
  final void Function() onBackpressed;
  const SearchAppBar({Key? key, required this.onBackpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.blueGrey.shade900,
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.blueGrey.shade900,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      leading: IconButton(
          onPressed: onBackpressed, icon: const Icon(Icons.arrow_back)),
      title: const TextField(
        decoration: InputDecoration(
          hintText: 'Ara...',
          border: InputBorder.none,
        ),
      ),
      bottom: AppBar(
        toolbarHeight: size.height * 0.14,
        backgroundColor: Colors.blueGrey.shade900,
        title: Wrap(
          children: const [
            IconActionChip(
              icon: Icons.photo_album,
              text: 'Fotoğraflar',
            ),
            IconActionChip(icon: Icons.videocam, text: 'Videolar'),
            IconActionChip(icon: Icons.link, text: 'Bağlantılar'),
            IconActionChip(icon: Icons.gif_box, text: 'Gifler'),
            IconActionChip(icon: Icons.headphones, text: 'Ses'),
            IconActionChip(icon: Icons.wysiwyg, text: 'Belgeler')
          ],
        ),
      ),
    );
  }
}
