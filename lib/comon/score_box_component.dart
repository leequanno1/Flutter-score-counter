import 'package:flutter/material.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class ScoreBoxComponent extends StatelessWidget {
  
  final double height;
  final double width;
  final int score;
  final EdgeInsetsGeometry margin;

  const ScoreBoxComponent({
    super.key, 
    this.height = 30, 
    this.width = 85, 
    this.margin = const EdgeInsets.all(0),
    required this.score, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: score >= 0 ? ColorSchema.primaryColor : ColorSchema.deleteColor,
      ),
      child: Center(
        child: Text(
          "$score \$",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
