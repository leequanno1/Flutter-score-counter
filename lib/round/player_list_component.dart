import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/round/player_item_component.dart';
import 'package:learning_bloc/round/players_bloc.dart';
import 'package:learning_bloc/round/players_state.dart';

class PlayerListComponent extends StatelessWidget {
  const PlayerListComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(builder: (context, state) {
      return Expanded(
          child: ListView.builder(
              itemCount: state.players.length,
              itemBuilder: (context, index) {
                return PlayerItemComponent(
                  player: state.players[index],
                );
              }));
    });
  }
}
