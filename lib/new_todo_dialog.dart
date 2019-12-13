import 'package:flutter/material.dart';

class NewTodoDialog extends StatefulWidget {
  final Function onAdd;

  NewTodoDialog({@required this.onAdd});

  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Add an entry'),
    content: TextField(
      decoration: InputDecoration(hintText: 'Enter a task'),
      controller: controller,
    ),
    actions: <Widget>[
      FlatButton(
        child: Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(),
      ),
      FlatButton(
        child: Text('Add'),
        onPressed: () {
          if (controller.text.isNotEmpty) {
            widget.onAdd(controller.text);
          }
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}