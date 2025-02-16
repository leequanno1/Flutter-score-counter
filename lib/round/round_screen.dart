import 'package:flutter/material.dart';
import 'package:learning_bloc/models/casinum.dart';
import 'package:learning_bloc/round/dealer_component.dart';
import 'package:learning_bloc/round/player_list_action_bar.dart';
import 'package:learning_bloc/round/player_list_component.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class RoundScreen extends StatelessWidget {
  final Casinum casinum;
  const RoundScreen({super.key, required this.casinum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
            bottom: const BorderSide(color: ColorSchema.borderColor, width: 1)),
        title: Text(
          casinum.name,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
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
    );
  }
}
