import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

@DataClassName('TodoEntry')
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}

@UseMoor(tables: [Todos])
class Database extends _$Database {
  @override
  int get schemaVersion => 1;

  Database() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  Future<List<TodoEntry>> get allTodoEntries => select(todos).get();
  Future<int> addTodoEntry(TodosCompanion entry) => into(todos).insert(entry);
}
