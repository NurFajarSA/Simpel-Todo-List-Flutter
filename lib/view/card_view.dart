import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo_app/model/task.dart';
import 'package:simple_todo_app/styles/color_style.dart';
import 'package:simple_todo_app/styles/font_style.dart';
import 'package:simple_todo_app/view/empty_state.dart';

class CardView extends StatefulWidget {
  const CardView({ Key? key }) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox("task"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Snapshot Error", style: TextStyle(color: danger),),
            );
          } else {
            var tasksBox = Hive.box("task");
            return ValueListenableBuilder(
              valueListenable: tasksBox.listenable(),
              builder: (context, Box tasks, _) {
                if (tasks.isEmpty) {
                  return showEmptyState();
                } else {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: tempTask.isComplete,
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
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                              icon:
                                                  const Icon(Icons.delete),
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
          return Center(
            child: Container(
              margin: const EdgeInsets.all(128),
              child: CircularProgressIndicator(
                  backgroundColor: primary2,
                  color: primary3,
                  strokeWidth: 3.0,
                ),
            ),
          );
        }
      },
    );
  }
}
