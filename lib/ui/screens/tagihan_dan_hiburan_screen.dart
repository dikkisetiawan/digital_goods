import '/ui/widgets/kfloating_action_button.dart';

import '/ui/theme.dart';
import 'package:flutter/material.dart';
import '../widgets/grid_view_widget.dart';

class TagihanDanHiburanScreen extends StatelessWidget {
  const TagihanDanHiburanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: bodyWidget(context),
    );
  }

  Stack bodyWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(defaultTopLeftCircular),
                  bottomRight: Radius.circular(defaultTopLeftCircular))),
          height: MediaQuery.of(context).size.height / 4,
        ),
        // Image.asset(
        //   'assets/promo1.jpg',
        //   height: MediaQuery.of(context).size.height / 2.5,
        //   opacity: AlwaysStoppedAnimation(0.2),
        // ),
        mainBodyWidget(context),
      ],
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0.0,
      leading: Icon(
        Icons.arrow_back,
        color: kBackgroundColor,
      ),
      centerTitle: false,
      title: Text(
        'Tagihan dan Hiburan',
        style: whiteTextStyle.copyWith(fontSize: 18),
      ),
    );
  }

  Widget mainBodyWidget(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: defaultMargin * 3,
          ),
          digitalGoodsContainerWidget(),
          const SizedBox(
            height: defaultMargin,
          ),
          Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Text(
              'Transaksi Berlangsung',
              style: blackTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: itemTileWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Text(
              'Riwayat Transaksi',
              style: blackTextStyle,
            ),
          ),
          riwayatListWidget(),
          const SizedBox(
            height: defaultMargin * 2,
          ),
        ],
      ),
    );
  }

  Padding riwayatEmptyWidget() {
    return Padding(
      padding: const EdgeInsets.all(defaultMargin),
      child: Column(
        children: [
          Image.asset(
            'assets/city.jpg',
            width: 200,
            height: 200,
          ),
          Text(
            'Kamu belum pernah melakukan transaksi apapun, Yuk mulai transaksi sekarang!',
            style: blackTextStyle.copyWith(
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget riwayatListWidget() {
    return Column(
      children: [
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return itemTileWidget();
          },
        ),
        const SizedBox(
          height: defaultMargin,
        ),
        KfloatingActionButton(onPressed: () {}, title: 'Lihat Semua Transaksi'),
        const SizedBox(
          height: defaultMargin * 2,
        ),
      ],
    );
  }

  Container itemTileWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: defaultMargin / 2),
      decoration: BoxDecoration(color: kGreyColor, borderRadius: kBorderRadius),
      child: ListTile(
        leading: Icon(
          Icons.wifi,
          color: kPrimaryColor,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pulsa Indosat Rp 50.000',
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: defaultMargin / 4,
            ),
            Text(
              '18 Maret 2022',
              style: greyTextStyle,
            )
          ],
        ),
        trailing: Text(
          'Berhasil',
          style: whiteTextStyle.copyWith(color: kSuccessColor),
        ),
      ),
    );
  }

  Container digitalGoodsContainerWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
      padding: const EdgeInsets.only(
          top: defaultMargin, left: defaultMargin, right: defaultMargin),
      decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: kBorderRadius,
          boxShadow: [kShadow]),
      child: const DigitalGoodsGridViewWidget(),
    );
  }

  GestureDetector leadingWidget() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding:
            const EdgeInsets.only(top: defaultMargin * 2, left: defaultMargin),
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
                style: whiteTextStyle.copyWith(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
