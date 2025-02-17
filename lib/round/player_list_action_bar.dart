import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/round/players_bloc.dart';
import 'package:learning_bloc/round/players_state.dart';

class PlayerListActionBar extends StatelessWidget {
  const PlayerListActionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(
      buildWhen: (previous, current) => previous.itemSelecteds != current.itemSelecteds,
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
            IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline))
          else
            IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      );
    });
  }
}
