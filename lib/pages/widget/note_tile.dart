import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:todo_isar/pages/widget/note_settings.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
    required this.text,
    required this.onEditPressed,
    required this.onRemovePressed,
  });
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onRemovePressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(
        top: 10,
        left: 25,
        right: 25,
      ),
      child: ListTile(
          title: Text(text),
          trailing: Builder(builder: (context) {
            return IconButton(
              onPressed: () => showPopover(
                context: context,
                backgroundColor: Theme.of(context).colorScheme.surface,
                bodyBuilder: (context) => NoteSettings(
                  onEditTap: onEditPressed,
                  onDeleteTap: onRemovePressed,
                ),
                width: 100,
                height: 100,
              ),
              icon: Icon(Icons.more_vert),
            );
          })),
    );
  }
}
