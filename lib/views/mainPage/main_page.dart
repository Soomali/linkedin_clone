import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_clone/views/notification/notification_page.dart';

import '../../data/data.dart';
import '../drawer/custom_drawer.dart';
import '../appBar/app_bar.dart';
import '../post/post.dart';

part 'main_layout.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final _pages = [
    PostPage(
      posts: List.generate(30, (index) => Post.random()),
    ),
    MainLayout(),
    MainLayout(),
    NotificationPage(),
    MainLayout()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      drawer: const CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedIconTheme: Theme.of(context)
            .iconTheme
            .copyWith(size: (Theme.of(context).iconTheme.size ?? 18) + 5),
        onTap: (index) {
          if (index != _selectedIndex) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        unselectedIconTheme: Theme.of(context).iconTheme.copyWith(
            color: Colors.grey,
            size: (Theme.of(context).iconTheme.size ?? 18) + 3),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 14,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            activeIcon: Icon(Icons.home_outlined),
            label: 'Ana Sayfa',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.people),
            activeIcon: Icon(Icons.people_outline),
            label: 'Ağım',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Yayınla',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            activeIcon:
                Transform.rotate(angle: 0.4, child: Icon(Icons.notifications)),
            label: 'Bildirimler',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.work),
            activeIcon: Icon(Icons.work_outline_rounded),
            label: 'İş ilanları',
          ),
        ],
      ),
    );
  }
}
