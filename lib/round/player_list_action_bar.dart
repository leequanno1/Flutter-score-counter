import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/dialog/create_player_dialog.dart';
import 'package:learning_bloc/dialog/delete_player_dialog.dart';
import 'package:learning_bloc/models/player.dart';
import 'package:learning_bloc/round/player_event.dart';
import 'package:learning_bloc/round/players_bloc.dart';
import 'package:learning_bloc/round/players_state.dart';

class PlayerListActionBar extends StatelessWidget {
  const PlayerListActionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(
        buildWhen: (previous, current) =>
            previous.itemSelecteds != current.itemSelecteds ||
            previous.players.length != current.players.length,
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Total(${state.players.length})",
                  style: TextStyle(fontSize: 18),
                ),
              )),
              if (state.itemSelecteds > 0)
                IconButton(
                    onPressed: () => onDeletePopup(context),
                    icon: Icon(Icons.delete_outline))
              else
                IconButton(
                    onPressed: () => onCreatePopup(context),
                    icon: Icon(Icons.add))
            ],
          );
        });
  }

  Future onCreatePopup(BuildContext context) async {
    final res = await showDialog<Player>(
        context: context, builder: (context) => CreatePlayerDialog());
    if (res != null) {
      context.read<PlayersBloc>().add(PlayerAdd(res));
    }
  }

  Future onDeletePopup(BuildContext context) async {
    final res = await showDialog<bool>(
        context: context, builder: (context) => DeletePlayerDialog());
    if (res != null && res) {
      context.read<PlayersBloc>().add(PlayerDeleted());
    }
  }
}
