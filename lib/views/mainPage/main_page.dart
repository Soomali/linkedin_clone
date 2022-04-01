import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../drawer/custom_drawer.dart';

part 'app_bar.dart';
part 'search_bar.dart';
part 'main_layout.dart';
part 'custom_avatar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainLayout(),
      drawer: CustomDrawer(),
    );
  }
}
