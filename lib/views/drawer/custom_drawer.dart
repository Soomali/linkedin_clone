import 'package:flutter/material.dart';

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
          ProfileArea(),
          if (!isPremiumUser) TryPremium(),
          News(),
          DrawerItem(
            text: 'Gruplar',
          ),
          DrawerItem(
            text: 'Etkinlikler',
          ),
          DrawerItemExtension(),
          DrawerItem(
            text: 'Takip edilen hashtagler',
          ),
          DrawerItem(
            text: 'Daha fazla keşfet',
          )
        ],
      ),
    );
  }
}
