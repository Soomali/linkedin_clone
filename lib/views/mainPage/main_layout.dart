part of 'main_page.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const LinkedInAppBar(),
        SliverList(
            delegate: SliverChildBuilderDelegate(((context, index) {
          return Text('$index');
        }), childCount: 100)),
      ],
    );
  }
}
