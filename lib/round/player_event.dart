import 'package:learning_bloc/models/player.dart';

class PlayerEvent {}

class PlayerAdd extends PlayerEvent{
  final Player player;

  PlayerAdd(this.player);
}

class PlayerDeleted extends PlayerEvent {}

class PlayerSelected extends PlayerEvent {
  final int position;

  PlayerSelected(this.position);
}

class PlayerUnSelecteAll extends PlayerEvent {}

class PlayerUpdate extends PlayerEvent{
  final Player player;
  final int position;
  // -1: decrease, 0: else, 1: increase
  final int typeUpdate;

  PlayerUpdate(this.player, this.position, this.typeUpdate);
}
