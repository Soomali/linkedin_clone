import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'custom_avatar.dart';
part 'search_bar.dart';

class LinkedInAppBar extends StatelessWidget {
  const LinkedInAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.dark, //android için
        statusBarBrightness: Brightness.light, //ios için
      ),
      floating: true,
      leadingWidth: size.width * 0.12,
      leading: const Padding(
          padding: EdgeInsets.only(left: 8.0), child: CustomAvatar()),
      actions: const [
        Padding(padding: EdgeInsets.only(right: 8), child: Icon(Icons.message))
      ],
      title: const SearchBar(),
    );
  }
}
