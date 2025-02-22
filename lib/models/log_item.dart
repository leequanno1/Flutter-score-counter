class LogItem {
  String content;
  DateTime initDate;
  int logType;

  LogItem(this.content, this.initDate, this.logType);
}

class LogType {
  static const int log1 = 1;
  static const int log2 = 2;
  static const int log3 = 3;
  static const int log4 = 4;
}