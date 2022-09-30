import 'package:flutter/material.dart';

class TitleInfoWidget extends StatelessWidget {
  const TitleInfoWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black.withOpacity(0.8),
      ),
    );
  }
}
