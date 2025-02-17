import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/models/player.dart';
import 'package:learning_bloc/round/player_event.dart';
import 'package:learning_bloc/round/players_state.dart';

class PlayersBloc extends Bloc<PlayerEvent, PlayersState> {
  PlayersBloc(): super(PlayersInit([
    Player(id: 1, name: "name1", score: 2, deafaultBet: 2, initDate: DateTime.now()),
    Player(id: 2, name: "name2", score: 2, deafaultBet: 2, initDate: DateTime.now()),
    Player(id: 3, name: "name3", score: 2, deafaultBet: 2, initDate: DateTime.now()),
    Player(id: 4, name: "name4", score: 2, deafaultBet: 2, initDate: DateTime.now()),
  ])) {
    
    on<PlayerAdd>((event, emit) {
      final List<Player> playes = List<Player>.from(state.players)
      ..add(event.player);
      emit(PlayersInit(playes));
    });

    on<PlayerDeleted>((event, emit) {
      final List<Player> players = List<Player>.from(state.players);
      for(int i = state.isSelected.length-1; i >= 0; i--) {
        if (state.isSelected[i]) {
          players.removeAt(i);
        }
      }
    });

    on<PlayerSelected>((event, emit) {
      final List<Player> playes = List<Player>.from(state.players);
      final List<bool> isSelected = List<bool>.from(state.isSelected);
      isSelected[event.position] = !isSelected[event.position];
      final int itemSeleted = state.itemSelecteds;
      emit(PlayersUpdate(playes, isSelected, itemSeleted));
    });

    on<PlayerUnSelecteAll>((event, emit) {

    });

    on<PlayerUpdate>((event, emit) {
      final List<Player> playes = List<Player>.from(state.players);
      playes[event.position] = event.player;
      final List<bool> isSelected = List<bool>.from(state.isSelected);
      final int itemSeleted = state.itemSelecteds;
      emit(PlayersUpdate(playes, isSelected, itemSeleted));
    });
  }
}