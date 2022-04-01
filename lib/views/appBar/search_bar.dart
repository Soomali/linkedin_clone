part of 'app_bar.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.04,
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            filled: true,
            fillColor: Colors.grey,
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).iconTheme.color,
            ),
            hintText: 'Arama Yap',
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
      ),
    );
  }
}
