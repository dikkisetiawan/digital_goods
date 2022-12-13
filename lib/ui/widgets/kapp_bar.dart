import 'package:flutter/material.dart';

import '../theme.dart';

class KappBar extends StatelessWidget {
  const KappBar({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return appBar(context, title: title);
  }

  AppBar appBar(BuildContext context, {required String? title}) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: kBlackColor,
          iconSize: defaultMargin,
        ),
      ),
      centerTitle: false,
      title: Text(
        title ?? 'Kembali',
        style: blueTextStyle,
      ),
    );
  }
}
