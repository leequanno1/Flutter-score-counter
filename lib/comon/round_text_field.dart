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

  final Color borderColor;

  final TextStyle style;

  final TextAlign textAlign;
  
  final EdgeInsetsGeometry contentPadding;

  final TextInputType keyboardType;

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

    this.borderColor = ColorSchema.borderColor, 

    this.style = const TextStyle(fontSize: 15), 
    
    this.textAlign = TextAlign.start, 
    
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12), 
    
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        keyboardType: keyboardType,
        textAlign: textAlign,
        autofocus: autoFocus,
        controller: controller,
        style: style,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: contentPadding,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: borderColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: borderColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
