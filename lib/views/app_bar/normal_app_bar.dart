import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_clone/views/app_bar/normal_app_bar_pop_up.dart';

class NormalAppBar extends StatelessWidget {
  final void Function() onSearchPressed;
  const NormalAppBar({Key? key, required this.onSearchPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //SliverAppBar'lar normal app bar'lardan daha fazla özelleştirilebilirler.
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.blueGrey.shade900,
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      pinned: true,
      floating: true,
      stretch: true,
      backgroundColor: Colors.blueGrey.shade900,
      titleTextStyle: TextStyle(color: Colors.grey.shade500, fontSize: 24),
      iconTheme: Theme.of(context).iconTheme,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(child: Text('WhatsApp')),
          IconButton(
              onPressed: onSearchPressed, icon: const Icon(Icons.search)),
          const NormalAppBarPopUp()
        ],
      ),
      //gezinebileceğimiz tabların içeriği burada belirtiliyor.
      bottom: TabBar(
          labelPadding: EdgeInsets.only(bottom: 12),
          isScrollable: true,
          tabs: [
            SizedBox(
                width: size.width * 0.1, child: Icon(Icons.camera_alt_rounded)),
            SizedBox(
                width: size.width * 0.3,
                child: const Text(
                  'SOHBETLER',
                  textAlign: TextAlign.center,
                )),
            SizedBox(
                width: size.width * 0.3,
                child: const Text(
                  'DURUM',
                  textAlign: TextAlign.center,
                )),
            SizedBox(
                width: size.width * 0.3,
                child: const Text(
                  'ARAMALAR',
                  textAlign: TextAlign.center,
                ))
          ]),
    );
  }
}
