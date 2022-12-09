import 'package:flutter/material.dart';

import '../theme.dart';

class DigitalGoodsGridViewWidget extends StatelessWidget {
  const DigitalGoodsGridViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 80,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: defaultMargin / 4,
              mainAxisExtent: defaultMargin * 4,
              mainAxisSpacing: defaultMargin / 4),
          itemCount: 8,
          itemBuilder: (BuildContext ctx, index) {
            return circleIconButtonWidget();
          }),
    );
  }

  Widget circleIconButtonWidget() {
    return Column(
      children: [
        RawMaterialButton(
          onPressed: () {},
          elevation: 2.0,
          fillColor: kGreyColor,
          padding: const EdgeInsets.all(15.0),
          shape: const CircleBorder(),
          child: Icon(
            Icons.shopping_bag,
            color: kPrimaryColor,
            size: defaultMargin,
          ),
        ),
        const SizedBox(height: defaultMargin / 2),
        const Text('title here')
      ],
    );
  }
}
