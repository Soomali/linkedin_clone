import 'package:flutter/material.dart';
import 'package:flutter_app_clone/views/main_body.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.red),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 12, 20, 26),
        colorScheme: ColorScheme.dark(primary: Colors.grey.shade500),
        popupMenuTheme: PopupMenuThemeData(color: Colors.blueGrey.shade900),
        primaryColor: Colors.red,
        tabBarTheme: TabBarTheme(
            labelColor: Colors.teal.shade400,
            labelStyle: TextStyle(color: Colors.teal.shade400, fontSize: 16),
            unselectedLabelColor: Colors.grey.shade500,
            unselectedLabelStyle:
                TextStyle(color: Colors.grey.shade500, fontSize: 16),
            indicator: BoxDecoration(
                color: Colors.blueGrey.shade900,
                border: Border(
                    bottom:
                        BorderSide(color: Colors.teal.shade400, width: 3.0)))),
        iconTheme: IconThemeData(color: Colors.grey.shade500),
      ),
      home: MainBody(
        cameras: cameras,
      ),
    );
  }
}
