import 'package:flutter/material.dart';
import 'package:learning_bloc/styles/button.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class RemoveCasinumDialog extends StatelessWidget {
  const RemoveCasinumDialog({super.key});

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
                      "Do you want to delete those casinums? This action can’t undo.",
                      style: TextStyle(fontSize: 18),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop<bool>(context, false);
                      },
                      style: buttonSecondary,
                      child: Text("Cancel"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop<bool>(context, true);
                          },
                          style: buttonDelete,
                          child: Text("Delete")),
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
