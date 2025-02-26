import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/log/log_history_screen.dart';
import 'package:learning_bloc/models/casinum.dart';
import 'package:learning_bloc/round/dealer_component.dart';
import 'package:learning_bloc/round/player_list_action_bar.dart';
import 'package:learning_bloc/round/player_list_component.dart';
import 'package:learning_bloc/round/players_bloc.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class RoundScreen extends StatelessWidget {
  final Casinum casinum;
  const RoundScreen({super.key, required this.casinum});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PlayersBloc(casinum.id))],
        child: Scaffold(
          appBar: AppBar(
            shape: Border(
                bottom:
                    const BorderSide(color: ColorSchema.borderColor, width: 1)),
            title: Text(
              casinum.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            actions: [
              PopupMenuButton(onSelected: (value) {
                switch (value) {
                  case 1:
                    break;
                  case 2:
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Full height
                      backgroundColor: Colors.transparent,
                      builder: (context) => LogHistoryScreen(casinumId: casinum.id,),
                    );
                    break;
                }
              }, itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          const Icon(Icons.settings_outlined),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: const Text("Setting"))
                        ],
                      )),
                  PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: [
                          const Icon(Icons.history_edu),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: const Text("History log"))
                        ],
                      ))
                ];
              })
            ],
          ),
          body: Column(
            children: [
              DealerComponent(),
              PlayerListActionBar(),
              PlayerListComponent(),
            ],
          ),
        ));
  }
}
