import 'package:flutter/material.dart';
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
            primaryColor: Color.fromRGBO(49, 51, 53, 1),
            scaffoldBackgroundColor: Colors.brown.shade800,
            appBarTheme:
                AppBarTheme(backgroundColor: Color.fromRGBO(49, 51, 53, 1)),
            iconTheme: IconThemeData(color: Colors.white70)),
        debugShowCheckedModeBanner: false,
        
        home: MainPage());
  }
}
