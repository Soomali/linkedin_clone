import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../drawer/custom_drawer.dart';
import '../appBar/app_bar.dart';

part 'main_layout.dart';

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
