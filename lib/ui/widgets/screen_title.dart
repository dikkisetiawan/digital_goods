import 'package:flutter/material.dart';
import '../../ui/theme.dart';

// ignore: must_be_immutable
class ScreenTitle extends StatelessWidget {
  String title;
  ScreenTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: blueTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 21),
    );
  }
}
