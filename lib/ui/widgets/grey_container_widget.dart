import 'package:flutter/material.dart';

import '../theme.dart';

class GreyContainerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;

  const GreyContainerWidget({
    Key? key,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(top: defaultMargin),
      padding: const EdgeInsets.all(defaultMargin),
      decoration: BoxDecoration(color: kGreyColor, borderRadius: kBorderRadius),
      child: child,
    );
  }
}
