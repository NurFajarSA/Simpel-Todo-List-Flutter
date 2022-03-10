import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  late String? name;
  @HiveField(1)
  late String? date;
  @HiveField(2)
  late String? startTime;
  @HiveField(3)
  late String? endTime;
  @HiveField(4)
  late bool isComplete;

  Task(this.name, this.date, this.startTime, this.endTime, this.isComplete);
}
