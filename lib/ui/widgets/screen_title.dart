import 'package:flutter/material.dart';
import '../../ui/theme.dart';

// ignore: must_be_immutable
class Ktitle extends StatelessWidget {
  String title;
  String? buttonText;
  double? fontSize;
  Function()? onPressed;

  Ktitle({
    super.key,
    required this.title,
    this.buttonText,
    this.onPressed,
    this.fontSize = 21,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: blueTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: fontSize),
        ),
        Visibility(
          visible: buttonText != null,
          replacement: const SizedBox(),
          child: TextButton(
              onPressed: onPressed,
              child: Text(
                buttonText ?? '',
                style: buttonTextStyle,
              )),
        )
      ],
    );
  }
}
