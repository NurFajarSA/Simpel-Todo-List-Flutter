import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/about_me.dart';
import 'package:simple_todo_app/create_task.dart';
import 'package:simple_todo_app/model/task.dart';
import 'package:simple_todo_app/styles/assets.dart';
import 'package:simple_todo_app/styles/color_style.dart';
import 'package:simple_todo_app/styles/font_style.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SimpleTodo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Scaffold(
          backgroundColor: primary2,
          appBar: AppBar(
            title: Image.asset(
              appBar,
              fit: BoxFit.contain,
              scale: 2.0,
            ),
            backgroundColor: primary2,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Get.to(() => const AboutMe());
                },
                icon: Icon(
                  Icons.account_circle,
                  color: primary3,
                  size: 32,
                ),
              ),
              const SizedBox(width: 8),
            ],
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: primary2,
                statusBarIconBrightness: Brightness.dark),
            titleSpacing: 20,
          ),
          floatingActionButton: SizedBox(
            height: 56,
            child: createNewTask(),
          ),
          body: SafeArea(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Hi, Nur Fajar Sayyidul Ayyam!",
                        style: heading2,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Tasks List",
                        style: heading3,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: showEmptyState(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget createNewTask() => FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: primary3,
        icon: Icon(
          Icons.add,
          color: primary2,
        ),
        onPressed: () {
          Get.to(() => const CreateTask());
        },
        label: Text(
          "Add Task",
          style: bodyLight,
        ),
      );

  Widget showEmptyState() => Column(
        children: [
          const SizedBox(
            height: 128,
          ),
          Image.asset(
            emptyState,
            scale: 2.0,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "There are no tasks to complete",
            style: bodyDark,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Start to create a new task",
            style: text,
          )
        ],
      );
}
