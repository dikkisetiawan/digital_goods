import 'package:digital_goods/ui/theme.dart';

import 'package:flutter/material.dart';

class TagihanDanHiburanScreen extends StatelessWidget {
  const TagihanDanHiburanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kPrimaryColor,
            height: MediaQuery.of(context).size.height / 2.5,
            child: leadingWidget(),
          ),
          // Image.asset(
          //   'assets/promo1.jpg',
          //   height: MediaQuery.of(context).size.height / 2.5,
          //   opacity: AlwaysStoppedAnimation(0.2),
          // ),
          Container(
            margin: const EdgeInsets.only(
                top: defaultMargin * 5,
                left: defaultMargin,
                right: defaultMargin),
            height: 200,
            decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: kBorderRadius,
                boxShadow: [kShadow]),
          )
        ],
      ),
    );
  }

  GestureDetector leadingWidget() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(defaultMargin),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: kWhiteColor,
              ),
              const SizedBox(
                width: defaultMargin / 2,
              ),
              Text(
                'Tagihan & Hiburan',
                style: whiteTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
