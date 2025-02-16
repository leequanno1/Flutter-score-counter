import 'package:flutter/material.dart';
import 'package:learning_bloc/comon/score_box_component.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class DealerComponent extends StatelessWidget {
  const DealerComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              score: 10,
              margin: EdgeInsets.only(left: 50),
            )
          ],
        ),
      ),
    );
  }
}
