import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo_app/view/about_me.dart';
import 'package:simple_todo_app/view/create_task.dart';
import 'package:simple_todo_app/model/task.dart';
import 'package:simple_todo_app/styles/assets.dart';
import 'package:simple_todo_app/styles/color_style.dart';
import 'package:simple_todo_app/styles/font_style.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            statusBarColor: primary2, statusBarIconBrightness: Brightness.dark),
        titleSpacing: 20,
      ),
      floatingActionButton: SizedBox(
        height: 56,
        child: createNewTask(),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20, left:20, bottom: 8),
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
              ]
            )
          ),
          
          FutureBuilder(
            future: Hive.openBox("task"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error"),
                  );
                } else {
                  var tasksBox = Hive.box("task");
                    return ValueListenableBuilder(
                        // box: tasksBox,
                        valueListenable: tasksBox.listenable(),
                        builder: (context, Box tasks, _) {
                          if (tasks.isEmpty) {
                            return showEmptyState();
                          } else {
                            return ListView.builder(
                              shrinkWrap:true,
                                itemCount: tasks.length,
                                itemBuilder: (context, index) {
                                  Task tempTask = tasks.getAt(index);
                                  return Container(
                                      margin: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 78,
                                            width: double.infinity,
                                            margin: const EdgeInsets.only(
                                                top: 4, bottom: 4),
                                            child: Card(
                                                color: primary2,
                                                elevation: 2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            value:
                                                                tempTask.isComplete,
                                                            activeColor: primary3,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                tempTask.isComplete =
                                                                    value;
                                                              });
                                                            }),
                                                        const SizedBox(
                                                          width: 16,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "${tempTask.name}",
                                                              style: bodyDark,
                                                            ),
                                                            Text(
                                                              "${tempTask.date}  |  ${tempTask.startTime} - ${tempTask.endTime}",
                                                              style: text,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            tasks.deleteAt(index);
                                                          },
                                                          icon: const Icon(
                                                              Icons.delete),
                                                          color: danger,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          )
                                        ],
                                      ));
                                });
                          }
                        });
                  
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
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

  Widget showEmptyState() => Container(
        alignment: Alignment.center,
        child: Column(
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
              style: bodyState
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Start to create a new task",
              style: text,
            )
          ],
        ),
      );
}
