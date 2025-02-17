import 'package:learning_bloc/models/player.dart';

class PlayersState {
  final List<Player> players;
  final List<bool> isSelected;
  final int itemSelecteds;

  PlayersState(
    this.players, 
    this.isSelected, 
    this.itemSelecteds);
}

class PlayersInit extends PlayersState {
  PlayersInit(List<Player> players) : super(players, List.generate(players.length, (index) => false, growable: false), 0);
}

class PlayersUpdate extends PlayersState {
  PlayersUpdate(super.players, super.isSelected, super.itemSelecteds);
}