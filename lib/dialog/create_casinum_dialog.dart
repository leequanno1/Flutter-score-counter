import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learning_bloc/comon/round_text_field.dart';
import 'package:learning_bloc/comon/toast_message.dart';
import 'package:learning_bloc/models/casinum.dart';
import 'package:learning_bloc/styles/button.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class CreateCasinumDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  CreateCasinumDialog({super.key});

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
                      "Casinum name",
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: RoundTextField(
                    controller: _controller,
                    hintText: "New Casinum",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop<Casinum>(context, null);
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
                              Navigator.pop<Casinum>(
                                  context,
                                  Casinum(
                                      key: Random().nextInt(1000),
                                      name: textValue,
                                      delFlg: false,
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
