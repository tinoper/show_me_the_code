import 'package:code_my_screen/view/app.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    (record) {
      debugPrint('${record.level.name}: ${record.time}: ${record.message}');
      if (record.error != null) {
        debugPrint(record.error.toString());
        debugPrint(record.stackTrace.toString());
      }
    },
  );
  runApp(const App());
}
