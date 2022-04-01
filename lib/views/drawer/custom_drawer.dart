import 'package:flutter/material.dart';
import 'package:flutter_app_clone/colors/linked_in_dark_colors.dart';

part 'drawer_item.dart';
part 'news.dart';
part 'profile_area.dart';
part 'try_premium.dart';
part 'drawer_item_extension.dart';

class CustomDrawer extends StatelessWidget {
  final bool isPremiumUser = false;
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const ProfileArea(),
          if (!isPremiumUser) const TryPremium(),
          const News(),
          const DrawerItem(
            text: 'Gruplar',
          ),
          const DrawerItem(
            text: 'Etkinlikler',
          ),
          DrawerItemExtension(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).iconTheme.color,
              size: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          const DrawerItem(
            text: 'Takip edilen hashtagler',
          ),
          const DrawerItem(
            text: 'Daha fazla keşfet',
          )
        ],
      ),
    );
  }
}
