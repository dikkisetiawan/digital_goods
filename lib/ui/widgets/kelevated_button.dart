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
        style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(defaultCircular), // <-- Radius
            )),
        onPressed: onPressed,
        child: Text(
          title,
          style: whiteTextStyle.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
