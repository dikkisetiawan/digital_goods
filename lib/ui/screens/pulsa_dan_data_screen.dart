import '/cubit/digital_goods_cubit.dart';
import '/models/goods_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import '/ui/theme.dart';
import '/ui/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

class PulsaDanDataScreen extends StatefulWidget {
  const PulsaDanDataScreen({super.key});

  @override
  State<PulsaDanDataScreen> createState() => _PulsaDanDataScreenState();
}

class _PulsaDanDataScreenState extends State<PulsaDanDataScreen> {
  String phoneNumber = '0111';

  @override
  void initState() {
    print('prefix is ${phoneNumber.substring(0, 4)}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: appBarWidget(),
        body: listSuccessViewWidget(),
      ),
    );
  }

  TabBarView listSuccessViewWidget() {
    return TabBarView(children: [
      BlocBuilder<DigitalGoodsCubit, DigitalGoodsState>(
        builder: (context, state) {
          if (state is DigitalGoodsSuccess) {
            print('filter data ${getBrandByPrefix(state)?.name ?? 'unknown'}');
          }
          return Container();
        },
      ),
      initialTabViewWidget()
    ]);
  }

  Brand? getBrandByPrefix(DigitalGoodsSuccess state) =>
      state.digitalGoodsData.prepaid![getIndexOf(state)].brands!
          .singleWhereOrNull((x) => filterByPrefix(x));

  int getIndexOf(DigitalGoodsSuccess state) => state.digitalGoodsData.prepaid!
      .indexWhere((x) => x.name!.toLowerCase().contains('pulsa'));

  bool filterByPrefix(Brand x) =>
      x.prefixes!.contains(phoneNumber.substring(0, 4));

  Column initialTabViewWidget() {
    return Column(
      children: [
        const SizedBox(
          height: defaultMargin,
        ),
        SizedBox(
          width: 300,
          height: 300,
          child: Image.asset(
            'assets/city.jpg',
          ),
        ),
        Text(
          'Mau beli pulsa atau Paket Data? Yuk tulis nomormu di atas!',
          style: blackTextStyle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: kBackgroundColor,
      toolbarHeight: 180,
      title: flexibleSpaceWidget(),
      bottom: TabBar(
          labelPadding: const EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin / 2),
          indicatorColor: kPrimaryColor,
          labelColor: kBlackColor,
          labelStyle: blackTextStyle,
          tabs: const [Text('Pulsa'), Text('Paket Data')]),
    );
  }

  Column flexibleSpaceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultMargin,
        ),
        leadingWidget(),
        const SizedBox(
          height: defaultMargin,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Text(
            'Nomor Telepon',
            style: blackTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin / 2),
          child: KtextFormField(
              withTitle: false,
              prefix: BlocBuilder<DigitalGoodsCubit, DigitalGoodsState>(
                builder: (context, state) {
                  if (state is DigitalGoodsSuccess) {
                    return Text(
                      '${getBrandByPrefix(state)?.name ?? 'Unknown'}  ',
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.normal),
                    );
                  }
                  return Text(
                    'fail  ',
                    style: greyTextStyle,
                  );
                },
              ),
              title: 'Nomor Telpon'),
        ),
      ],
    );
  }

  GestureDetector leadingWidget() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
            color: kBlackColor,
          ),
          const SizedBox(
            width: defaultMargin,
          ),
          Text(
            'Pulsa & Data',
            style: blackTextStyle,
          )
        ],
      ),
    );
  }
}
