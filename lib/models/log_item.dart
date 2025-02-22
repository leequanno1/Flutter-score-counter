import 'package:hive/hive.dart';

part 'log_item.g.dart';

@HiveType(typeId: 1)
class LogItem extends HiveObject{
  
  @HiveField(0)
  String content;

  @HiveField(1)
  DateTime initDate;
  
  @HiveField(2)
  int logType;

  LogItem({required this.content, required this.initDate, required this.logType});
}

class LogType {
  static const int log1 = 1;
  static const int log2 = 2;
  static const int log3 = 3;
  static const int log4 = 4;
}