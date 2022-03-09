import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_todo_app/styles/assets.dart';
import 'package:simple_todo_app/styles/color_style.dart';
import 'package:simple_todo_app/styles/font_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle,
                  color: primary3,
                  size: 32,
                ),
                splashRadius:28,
              ),

              const SizedBox(width: 8),
            ],

            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: primary2,
              statusBarIconBrightness: Brightness.dark
            ),
            titleSpacing: 20,
          ),

          floatingActionButton: SizedBox(
            height: 56,
            child: createNewTask(),
          ),

          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 18.0, right: 18.0,),
              child: ListView(
                children: [
                  Column(
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget createNewTask() => FloatingActionButton.extended(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    backgroundColor: primary3,
    icon: Icon(Icons.add, color: primary2,),
    onPressed: (){},
    label: Text(
      "Add Task",
      style : bodyLight,
    ),
  );
}
