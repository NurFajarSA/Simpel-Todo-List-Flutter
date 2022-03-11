import 'package:simple_todo_app/convert_function.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/model/task.dart';
import 'package:hive/hive.dart';

void validateData(name, day, month, year, hourStart, minStart, hourEnd, minEnd) {
    String date = convertDate(day, month, year);
    String startTime = convertTime(hourStart, minStart);
    String endTime = convertTime(hourEnd, minEnd);
    Task tempTask = Task(name, date, startTime, endTime, false);
    addTask(tempTask);
    Get.back(canPop: false);
  }
  
  void addTask(Task newTask) async {
  var task = await Hive.openBox("task");
  task.add(newTask);
  }

String? isEmpty(value) {
  if (value.isEmpty) {
    return "Please complete this field";
  } else {
    return null;
  }
}

String? isValidDay(value) {
  if (value.isEmpty || (0 == int.parse(value)) || (int.parse(value) > 31)) {
    return "";
  } else {
    return null;
  }
}

String? isValidMonth(value) {
  if (value.isEmpty || (0 == int.parse(value)) || (int.parse(value) > 12) || value.length != 2) {
    return "";
  } else {
    return null;
  }
}

String? isValidYear(value) {
  if (value.isEmpty || value.length != 4) {
    return "";
  } else {
    return null;
  }
}

String? isValidHour(value) {
  if (value.isEmpty || int.parse(value) >= 24 ||value.length != 2) {
    return "";
  } else {
    return null;
  }
}

String? isValidMin(value) {
  if (value.isEmpty || int.parse(value) >= 60 || value.length != 2) {
    return "";
  } else {
    return null;
  }
}
