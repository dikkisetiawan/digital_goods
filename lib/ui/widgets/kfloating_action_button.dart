import 'package:flutter/material.dart';

import '../theme.dart';
import 'kelevated_button.dart';

// ignore: must_be_immutable
class KfloatingActionButton extends StatelessWidget {
  void Function() onPressed;
  final String title;
  KfloatingActionButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom == 0.0
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            width: double.infinity,
            height: 40,
            child: KelevatedButtonWidget(title: title, onPressed: onPressed),
          )
        : const SizedBox();
  }
}

class KelevatedButtonWidget extends StatelessWidget {
  void Function() onPressed;
  final String title;

  KelevatedButtonWidget({
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
