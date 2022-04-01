part of 'main_page.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const LinkedInAppBar(),
        // BottomSliverBar(items: [
        //   BottomSliverBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Ana Sayfa',
        //       backgroundColor: Colors.red,
        //       activeIcon: Icon(Icons.home_filled),
        //       onTap: _setIndex),
        //   BottomSliverBarItem(
        //       icon: Icon(Icons.one_k),
        //       label: 'Ana Sayfa',
        //       backgroundColor: Colors.blue,
        //       onTap: _setIndex),
        //   BottomSliverBarItem(
        //       icon: Icon(Icons.notifications),
        //       label: 'Ana Sayfa',
        //       backgroundColor: Colors.blue,
        //       onTap: _setIndex),
        // ], selectedIndex: _selectedIndex),
        SliverList(
            delegate: SliverChildBuilderDelegate(((context, index) {
          return Text('$index');
        }), childCount: 100)),
      ],
    );
  }
}
