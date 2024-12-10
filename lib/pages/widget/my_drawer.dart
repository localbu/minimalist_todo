import 'package:flutter/material.dart';
import 'package:todo_isar/pages/settings_page.dart';
import 'package:todo_isar/pages/widget/drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // header
          DrawerHeader(
            child: Icon(Icons.edit),
          ),
          const SizedBox(
            height: 25,
          ),
          // note tile
          DrawerTile(
            title: 'Notes',
            leading: Icon(
              Icons.home,
              color: Colors.grey.shade500,
            ),
            onTap: () => Navigator.pop(context),
          ),

          // settings tile
          DrawerTile(
            title: 'Settings',
            leading: Icon(
              Icons.settings,
              color: Colors.grey.shade500,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
