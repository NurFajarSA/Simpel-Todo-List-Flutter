import 'package:flutter/material.dart';
import 'package:simple_todo_app/styles/color_style.dart';
import 'package:simple_todo_app/styles/font_style.dart';
import 'package:simple_todo_app/validate.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController hourStartController = TextEditingController();
  TextEditingController minStartController = TextEditingController();
  TextEditingController hourEndController = TextEditingController();
  TextEditingController minEndController = TextEditingController();

  bool isComplete = false;

  void validate() {
    if (formKey.currentState!.validate()) {
      validateData(
          nameController.text,
          dayController.text,
          monthController.text,
          yearController.text,
          hourStartController.text,
          minStartController.text,
          hourEndController.text,
          minEndController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary2,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondary1,
        ),
        title: Text("Create a Task", style: bodyDark),
        centerTitle: true,
        backgroundColor: primary2,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: ternary2,
            height: 1.0,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Task Name",
                  style: bodyDark,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: nameController,
                  style: text,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      hintText: "Enter your task name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: primary3, width: 2))),
                  validator: isEmpty,
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  "Task Date",
                  style: bodyDark,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                        width: 54,
                        margin: const EdgeInsets.only(right: 6),
                        child: TextFormField(
                          controller: dayController,
                          style: text,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          maxLength: 2,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(16),
                              hintText: "DD",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              counterText: '',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: primary3, width: 2))),
                          validator: isValidDay,
                        )),
                    Text(
                      "/",
                      style: text,
                    ),
                    Container(
                        width: 54,
                        margin: const EdgeInsets.only(left: 6, right: 6),
                        child: TextFormField(
                          controller: monthController,
                          style: text,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          maxLength: 2,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(16),
                              hintText: "MM",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              counterText: '',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: primary3, width: 2))),
                          validator: isValidMonth,
                        )),
                    Text(
                      "/",
                      style: text,
                    ),
                    Container(
                        width: 72,
                        margin: const EdgeInsets.only(left: 6),
                        child: TextFormField(
                          controller: yearController,
                          style: text,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.datetime,
                          maxLength: 4,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(16),
                              hintText: "YYYY",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              counterText: '',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: primary3, width: 2))),
                          validator: isValidYear,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  "Task Time",
                  style: bodyDark,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                        width: 50,
                        margin: const EdgeInsets.only(right: 6),
                        child: TextFormField(
                            controller: hourStartController,
                            style: text,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.datetime,
                            maxLength: 2,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16),
                                hintText: "00",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                counterText: '',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: primary3, width: 2))),
                            validator: isValidHour)),

                    Text(
                      ":",
                      style: text,
                    ),

                    Container(
                        width: 50,
                        margin: const EdgeInsets.only(right: 20, left: 6),
                        child: TextFormField(
                            controller: minStartController,
                            style: text,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.datetime,
                            maxLength: 2,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16),
                                hintText: "00",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                counterText: '',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: primary3, width: 2))),
                            validator: isValidMin)),

                    SizedBox(
                      width: 18,
                      child: Divider(
                        thickness: 1,
                        color: secondary1,
                      ),
                    ),

                    Container(
                        width: 50,
                        margin: const EdgeInsets.only(right: 6, left: 20),
                        child: TextFormField(
                            controller: hourEndController,
                            style: text,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.datetime,
                            maxLength: 2,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16),
                                hintText: "00",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                counterText: '',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: primary3, width: 2))),
                            validator: isValidHour)), // jam
                    Text(
                      ":",
                      style: text,
                    ), // :
                    Container(
                        width: 50,
                        margin: const EdgeInsets.only(left: 6),
                        child: TextFormField(
                            controller: minEndController,
                            style: text,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.datetime,
                            maxLength: 2,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16),
                                hintText: "00",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                counterText: '',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: primary3, width: 2))),
                            validator: isValidMin)),
                  ],
                ),
              ]),
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: double.infinity,
          height: 44,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primary3),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)))),
              onPressed: validate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Task",
                    style: bodyLight,
                  )
                ],
              )),
        ),
        const SizedBox(
          height: 52,
        )
      ],
    );
  }
}
