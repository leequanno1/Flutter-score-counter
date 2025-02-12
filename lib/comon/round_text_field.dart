import 'package:flutter/material.dart';
import 'package:learning_bloc/styles/color_schema.dart';

class RoundTextField extends StatelessWidget {
  final bool autoFocus;

  final double height;
  
  final double width;

  final double textSize;

  final double radius;

  final String hintText;

  final TextEditingController controller;

  const RoundTextField({
    super.key,
    required this.controller,
    /// Default height
    this.height = 35.0,
    /// Default width
    this.width = double.infinity,
    /// Default text size
    this.textSize = 15.0,
    /// Default focus
    this.autoFocus = true,
    this.radius = 5,
    this.hintText = "",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        autofocus: autoFocus,
        controller: controller,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: ColorSchema.borderColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: ColorSchema.borderColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
