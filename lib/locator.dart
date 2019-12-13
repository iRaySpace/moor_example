import 'package:get_it/get_it.dart';
import 'database.dart';

void setupLocator() {
  GetIt.I.registerSingleton<Database>(Database());
}

