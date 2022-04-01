import 'package:flutter/material.dart';
import 'package:flutter_app_clone/colors/linked_in_dark_colors.dart';
import 'package:flutter_app_clone/views/mainPage/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            textTheme: const TextTheme(
                headline6:
                    TextStyle(color: LinkedInDarkColors.headline6TextColor),
                subtitle1: TextStyle(color: Colors.blue)),
            primaryColor: LinkedInDarkColors.primary,
            drawerTheme: const DrawerThemeData(
                backgroundColor: LinkedInDarkColors.primary),
            scaffoldBackgroundColor: LinkedInDarkColors.primary,
            appBarTheme:
                const AppBarTheme(backgroundColor: LinkedInDarkColors.primary),
            iconTheme:
                const IconThemeData(color: LinkedInDarkColors.iconColor)),
        debugShowCheckedModeBanner: false,
        home: MainPage());
  }
}
