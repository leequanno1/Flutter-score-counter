import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:learning_bloc/comon/string_helper.dart';
import 'package:learning_bloc/models/db_name.dart';
import 'package:learning_bloc/models/log_item.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class LogHistoryScreen extends StatelessWidget {
  
  final int casinumId;

  const LogHistoryScreen({super.key, required this.casinumId});

  List<Widget> handleGetLogger(){
    Box<LogItem> box = Hive.box<LogItem>(DbName.getLoggerBaseName(casinumId));
    return (box.values.map((item) => _logItem(item)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9, // 60% màn hình khi mở
      minChildSize: 0.3, // Kéo xuống tối thiểu 30% màn hình
      maxChildSize: 0.9, // Kéo lên tối đa 90% màn hình
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Thanh kéo
              Container(
                width: 50,
                height: 5,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Text("History log", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView(
                  controller: scrollController, // Cần thiết để cuộn nội dung bên trong
                  padding: EdgeInsets.all(10),
                  children: handleGetLogger(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _logItem(LogItem item) {
    Color color = ColorSchema.log1Color;
    switch (item.logType) {
      case LogType.log1:
        color = ColorSchema.log1Color;
        break;
      case LogType.log2:
        color = ColorSchema.log2Color;
        break;
      case LogType.log3:
        color = ColorSchema.log3Color;
        break;
      case LogType.log4:
        color = ColorSchema.log4Color;
        break;
    }
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black, width: 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(item.content, style: TextStyle(fontSize: 15))),
          Text(dateTimeConvert(item.initDate), style: TextStyle(fontSize: 15, color: Colors.black54)),
        ],
      ),
    );
  }
}
