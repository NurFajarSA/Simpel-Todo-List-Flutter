import 'package:flutter/material.dart';
import 'package:simple_todo_app/styles/font_style.dart';
import 'package:simple_todo_app/styles/assets.dart';

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
          Text("There are no tasks to complete", style: bodyState),
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
