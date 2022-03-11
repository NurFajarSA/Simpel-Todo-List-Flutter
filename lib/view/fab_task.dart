import 'package:flutter/material.dart';
import 'package:simple_todo_app/styles/font_style.dart';
import 'package:simple_todo_app/styles/color_style.dart';
import 'package:simple_todo_app/view/create_task.dart';
import 'package:get/get.dart';

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
