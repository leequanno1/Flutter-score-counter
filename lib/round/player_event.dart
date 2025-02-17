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

  PlayerUpdate(this.player, this.position);
}
