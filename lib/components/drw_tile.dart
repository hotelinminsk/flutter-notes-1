import 'package:flutter/material.dart';

class DrwTile extends StatelessWidget {
  final String title;
  final Widget leadingicon;
  final void Function()? onTap;
  DrwTile(
      {super.key,
      required this.title,
      required this.leadingicon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: leadingicon,
        onTap: onTap,
      ),
    );
  }
}
