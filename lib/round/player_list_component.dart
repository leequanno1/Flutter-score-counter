import 'package:flutter/material.dart';
import 'package:learning_bloc/round/player_item_component.dart';

class PlayerListComponent extends StatelessWidget {
  const PlayerListComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return PlayerItemComponent(defaultBetScore: 2,);
        }
      )
    );
  }
}
