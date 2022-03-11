import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/view/main_page.dart';
import 'package:simple_todo_app/model/task.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDirectory = await path.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SimpleTodo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home:const MainPage());
  }
}
