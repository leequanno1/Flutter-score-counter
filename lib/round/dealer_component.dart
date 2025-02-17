import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/comon/score_box_component.dart';
import 'package:learning_bloc/round/players_bloc.dart';
import 'package:learning_bloc/round/players_state.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class DealerComponent extends StatelessWidget {
  const DealerComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(
        buildWhen: (previous, current) {
          int preScore = 0, curScore = 0;
          for(var player in previous.players) {
            preScore += player.score;
          }
          for(var player in current.players) {
            curScore += player.score;
          }
          return preScore != curScore;
        },
        builder: (context, state) {
          int score = 0;
          for(var player in state.players) {
            score += player.score;
          }
          return Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(color: ColorSchema.dealerColor),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  const Text(
                    "Dealer",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ScoreBoxComponent(
                    score: score * -1,
                    margin: EdgeInsets.only(left: 50),
                  )
                ],
              ),
            ),
          );
        });
  }
}
