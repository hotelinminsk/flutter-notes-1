import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? deleteFunc;
  final void Function()? updateFunc;
  const NoteTile(
      {super.key,
      required this.text,
      required this.deleteFunc,
      required this.updateFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: ListTile(
        title: Text(text),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: updateFunc,
              icon: const Icon(Icons.edit),
            ),
            IconButton(onPressed: deleteFunc, icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
