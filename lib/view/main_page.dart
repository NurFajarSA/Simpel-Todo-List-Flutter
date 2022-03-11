import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/view/about_me.dart';
import 'package:simple_todo_app/styles/assets.dart';
import 'package:simple_todo_app/styles/color_style.dart';
import 'package:simple_todo_app/styles/font_style.dart';
import 'package:simple_todo_app/view/fab_task.dart';
import 'package:simple_todo_app/view/card_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

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
          const CardView(),
          const SizedBox(
            height: 78,
          )
        ],
      ),
    );
  }
}