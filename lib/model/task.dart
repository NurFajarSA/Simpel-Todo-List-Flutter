import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? date;
  @HiveField(2)
  String? startTime;
  @HiveField(3)
  String? endTime;
  @HiveField(4)
  bool? isComplete;

  Task(this.name, this.date, this.startTime, this.endTime, this.isComplete);
}
