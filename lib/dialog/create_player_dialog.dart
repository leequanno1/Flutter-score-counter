import 'package:flutter/material.dart';
import 'package:learning_bloc/comon/round_text_field.dart';
import 'package:learning_bloc/comon/toast_message.dart';
import 'package:learning_bloc/models/player.dart';
import 'package:learning_bloc/styles/button.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class CreatePlayerDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  CreatePlayerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 1, color: ColorSchema.borderColor)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 24, 30, 24),
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Player name",
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: RoundTextField(
                    controller: _controller,
                    hintText: "New player",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop<Player>(context, null);
                      },
                      style: buttonSecondary,
                      child: Text("Cancel"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            var textValue = _controller.text;
                            if (textValue.isNotEmpty) {
                              Navigator.pop<Player>(
                                  context,
                                  Player(
                                      id: DateTime.now().millisecondsSinceEpoch % 4000000000,
                                      name: _controller.text,
                                      score: 0,
                                      deafaultBet: 2,
                                      initDate: DateTime.now()));
                            } else {
                              showToastMessage(context, "Name is blank!!!");
                            }
                          },
                          style: buttonPrimary,
                          child: Text("Add")),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
