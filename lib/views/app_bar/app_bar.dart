import 'package:flutter/material.dart';
import 'package:flutter_app_clone/data/conversation_models.dart';
import 'package:flutter_app_clone/views/app_bar/normal_app_bar.dart';
import 'package:flutter_app_clone/views/app_bar/search_app_bar.dart';

class CloneAppBar extends StatefulWidget {
  const CloneAppBar({Key? key}) : super(key: key);

  @override
  State<CloneAppBar> createState() => _CloneAppBarState();
}

class _CloneAppBarState extends State<CloneAppBar> {
  var _showSearch = false;
  @override
  Widget build(BuildContext context) {
    //duruma göre iki appbar'dan birini göstermemizi sağlayan setState metodu.
    return _showSearch
        ? SearchAppBar(onBackpressed: () {
            setState(() {
              _showSearch = false;
            });
          })
        : NormalAppBar(
            onSearchPressed: () => setState(() {
                  _showSearch = true;
                }));
  }
}
