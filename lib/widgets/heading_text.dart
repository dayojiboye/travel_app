import 'package:flutter/material.dart';
import 'package:travel_app/utils/theme.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        color: kPrimary,
        fontSize: 28,
      ),
    );
  }
}
