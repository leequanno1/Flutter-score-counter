import 'package:hive/hive.dart';

part 'player.g.dart';

@HiveType(typeId: 2)
class Player extends HiveObject{

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;
  
  @HiveField(2)
  int score;
  
  @HiveField(3)
  int deafaultBet;
  
  @HiveField(4)
  DateTime initDate;

  Player({
    required this.id,
    required this.name,
    required this.score,
    required this.deafaultBet,
    required this.initDate,
  });
}