import 'package:flutter/material.dart';
import '/ui/theme.dart';

class KtextWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;

  const KtextWidget(
      {super.key,
      required this.title,
      this.fontSize = 14.0,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultMargin / 3),
      child: Text(
        title,
        style:
            blueTextStyle.copyWith(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
