import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'app_bar.dart';
part 'search_bar.dart';
part 'main_layout.dart';
part 'custom_avatar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(),
      drawer: Drawer(),
    );
  }
}
