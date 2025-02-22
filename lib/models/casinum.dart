import 'package:hive/hive.dart';

part 'casinum.g.dart';

@HiveType(typeId: 0)
class Casinum extends HiveObject{
  
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  bool delFlg;

  @HiveField(3)
  int deafaultBet;

  @HiveField(4)
  DateTime initDate;

  Casinum({
    required this.id,
    required this.name,
    required this.delFlg,
    required this.deafaultBet,
    required this.initDate,
  });
}
