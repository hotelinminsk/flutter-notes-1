import 'package:flutter/material.dart';
import 'package:newnotesapp/components/drw_tile.dart';
import 'package:newnotesapp/pages/settingspage.dart';

class Mydrw extends StatelessWidget {
  const Mydrw({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(Icons.note),
          ),
          DrwTile(
              title: "Notes",
              leadingicon: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              }),
          DrwTile(
              title: "Settings",
              leadingicon: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settingspage()));
              })
        ],
      ),
    );
  }
}
