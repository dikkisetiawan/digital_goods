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
            child: KelevatedButton(title: title, onPressed: onPressed),
          )
        : const SizedBox();
  }
}
