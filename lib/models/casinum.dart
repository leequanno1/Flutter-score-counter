class Casinum {
  int key;
  String name;
  bool delFlg;
  int deafaultBet;
  DateTime initDate = DateTime.now();

  Casinum({
    required this.key,
    required this.name,
    required this.delFlg,
    required this.deafaultBet,
    required this.initDate,
  });
}
