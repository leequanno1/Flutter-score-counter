import 'package:flutter/material.dart';
import 'package:learning_bloc/styles/color_schema.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: Size(95, 40),
  backgroundColor: ColorSchema.acceptColor,
  elevation: 0,
  foregroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5))
  )
);

final ButtonStyle buttonSecondary = ElevatedButton.styleFrom(
  minimumSize: Size(95, 40),
  backgroundColor: ColorSchema.secondaryColor,
  elevation: 0,
  foregroundColor: Colors.black,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5))
  )
);