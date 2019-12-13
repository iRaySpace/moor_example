import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'new_todo_dialog.dart';
import 'database.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = GetIt.I<Database>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              final todoEntries = await database.allTodoEntries;
              print(todoEntries);
            },
          ),
        ],
      ),
      body: Container(
        child: Text('Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => NewTodoDialog(
            onAdd: (value) async {
              await database.addTodoEntry(
                TodosCompanion(title: Value(value))
              );
            },
          ),
        ),
      ),
    );
  }
}
