import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:learning_bloc/models/db_name.dart';
import 'package:learning_bloc/models/log_item.dart';
import 'package:learning_bloc/models/player.dart';
import 'package:learning_bloc/round/player_event.dart';
import 'package:learning_bloc/round/players_state.dart';

class PlayersBloc extends Bloc<PlayerEvent, PlayersState> {
  final int casinumId;
  PlayersBloc(this.casinumId)
      : super(PlayersInit(Hive.box<Player>(DbName.getPlayerBaseName(casinumId))
            .values
            .toList())) {
    final Box<Player> box = Hive.box<Player>(DbName.getPlayerBaseName(casinumId));
    final Box<LogItem> logBox = Hive.box<LogItem>(DbName.getLoggerBaseName(casinumId));

    on<PlayerAdd>((event, emit) async {
      await box.put(event.player.id, event.player);
      await logBox.put(DateTime.now().microsecondsSinceEpoch % 4000000000, LogItem(content: "Player ${event.player.name} added.", initDate: DateTime.now(), logType: LogType.log1));
      final List<Player> updatedPlayers = List<Player>.from(state.players)
        ..add(event.player);
      // add db
      emit(PlayersInit(updatedPlayers));
    });

    on<PlayerDeleted>((event, emit) async {
      final List<Player> players = List<Player>.from(state.players);
      for (int i = state.isSelected.length - 1; i >= 0; i--) {
        if (state.isSelected[i]) {
          await box.delete(players[i].id);
          await logBox.put(DateTime.now().microsecondsSinceEpoch % 4000000000, LogItem(content: "Player ${players[i].name} removed.", initDate: DateTime.now(), logType: LogType.log2));
          players.removeAt(i);
        }
      }
      emit(PlayersInit(players));
    });

    on<PlayerSelected>((event, emit) {
      final List<Player> playes = List<Player>.from(state.players);
      final List<bool> isSelected = List<bool>.from(state.isSelected);
      isSelected[event.position] = !isSelected[event.position];
      final int itemSeleted = isSelected[event.position]
          ? state.itemSelecteds + 1
          : state.itemSelecteds - 1;
      emit(PlayersUpdate(playes, isSelected, itemSeleted));
    });

    on<PlayerUnSelecteAll>((event, emit) {});

    on<PlayerUpdate>((event, emit) async {
      final List<Player> playes = List<Player>.from(state.players);
      print(event.player.score);
      print(playes[event.position].score);
      final isIncrease = event.player.score - playes[event.position].score;
      playes[event.position] = event.player;
      final List<bool> isSelected = List<bool>.from(state.isSelected);
      final int itemSeleted = state.itemSelecteds;
      await box.put(event.player.id, event.player);
      if(isIncrease > 0) {
        await logBox.put(DateTime.now().microsecondsSinceEpoch % 4000000000, LogItem(content: "${event.player.name} has won $isIncrease\$.", initDate: DateTime.now(), logType: LogType.log4));
      }else{
        await logBox.put(DateTime.now().microsecondsSinceEpoch % 4000000000, LogItem(content: "${event.player.name} has lost ${isIncrease*-1}\$.", initDate: DateTime.now(), logType: LogType.log3));
      }
      emit(PlayersUpdate(playes, isSelected, itemSeleted));
    });
  }
}
