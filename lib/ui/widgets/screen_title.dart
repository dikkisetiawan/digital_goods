import 'package:flutter/material.dart';
import '../../ui/theme.dart';

// ignore: must_be_immutable
class Ktitle extends StatelessWidget {
  String title;
  String? buttonText;
  Function()? onPressed;

  Ktitle({
    super.key,
    required this.title,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              blueTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 21),
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
