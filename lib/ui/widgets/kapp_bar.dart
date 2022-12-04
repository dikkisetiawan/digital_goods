import 'package:flutter/material.dart';

import '../theme.dart';

class KappBar extends StatelessWidget {
  const KappBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return appBar(context);
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_circle_left_rounded),
          color: kPrimaryColor,
          iconSize: 40,
        ),
      ),
      centerTitle: false,
      title: Text(
        'Kembali',
        style: blueTextStyle,
      ),
    );
  }
}
