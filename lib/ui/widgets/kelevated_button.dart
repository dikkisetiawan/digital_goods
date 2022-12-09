import 'package:flutter/material.dart';

import '../theme.dart';

// ignore: must_be_immutable
class KelevatedButton extends StatelessWidget {
  void Function() onPressed;
  final String title;

  KelevatedButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kBackgroundColor,
          side: BorderSide(color: kPrimaryColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultCircular), // <-- Radius
          ),
        ),
        child: Text(
          title,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
