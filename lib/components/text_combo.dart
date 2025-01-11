// Created by: Adwaith Jayasankar, Created at: 11-01-2025 11:25
import 'package:flutter/material.dart';

class TextCombo extends StatelessWidget {
  const TextCombo({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 75,
          child: Text(
            leftText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          ":",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(width: 8),
        SizedBox(
          child: Text(
            rightText,
            style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
