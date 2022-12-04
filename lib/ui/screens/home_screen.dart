import 'package:digital_goods/ui/widgets/screen_title.dart';
import 'package:digital_goods/ui/widgets/search_field.dart';

import '/ui/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: appBarWidget(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(defaultMargin),
        children: [
          Text(
            'Hai,',
            style: blueTextStyle,
          ),
          ScreenTitle(title: 'Mareto'),
          const SizedBox(height: defaultMargin),
          const SearchField(),
          const SizedBox(height: defaultMargin),
          DigitalGoodsGridViewWidget(),
        ],
      ),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: kWhiteColor,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: kPrimaryColor,
            ))
      ],
    );
  }
}

class DigitalGoodsGridViewWidget extends StatelessWidget {
  const DigitalGoodsGridViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: defaultMargin / 2,
              mainAxisExtent: defaultMargin * 4,
              mainAxisSpacing: defaultMargin),
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
