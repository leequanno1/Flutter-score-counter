import 'package:flutter/material.dart';

showToastMessage(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      duration: Duration(seconds: 2),
    ),
  );
}
