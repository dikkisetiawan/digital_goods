import 'package:digital_goods/cubit/transaction_cubit.dart';
import 'package:digital_goods/models/transaction_model.dart';

import '/cubit/digital_goods_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/goods_model.dart';
import '/ui/widgets/kfloating_action_button.dart';

import '/ui/theme.dart';
import 'package:flutter/material.dart';
import '../widgets/grid_view_widget.dart';

class TagihanDanHiburanScreen extends StatefulWidget {
  const TagihanDanHiburanScreen({super.key});

  @override
  State<TagihanDanHiburanScreen> createState() =>
      _TagihanDanHiburanScreenState();
}

class _TagihanDanHiburanScreenState extends State<TagihanDanHiburanScreen> {
  @override
  void initState() {
    context.read<DigitalGoodsCubit>().fetchDigitalGoodsList();
    context.read<TransactionCubit>().fetchTransactionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
              'Riwayat Transaksi',
              style: blackTextStyle,
            ),
          ),
          BlocBuilder<TransactionCubit, TransactionState>(
            builder: (context, state) {
              if (state is FetchTransactionListSuccess) {
                return riwayatListWidget(state.transactionList.data);
              }
              return riwayatEmptyWidget();
            },
          ),
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

  Widget riwayatListWidget(List<DataModel>? data) {
    return Column(
      children: [
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data!.length,
          itemBuilder: (context, index) {
            return itemTileWidget(data, index);
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

  Container itemTileWidget(List<DataModel>? data, int index) {
    MetaModel? meta = data![index].details![0].meta;

    return Container(
      margin: const EdgeInsets.only(bottom: defaultMargin / 2),
      decoration: BoxDecoration(color: kGreyColor, borderRadius: kBorderRadius),
      child: ListTile(
        onTap: () {},
        leading: Icon(
          Icons.wifi,
          color: kPrimaryColor,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${meta?.productType ?? 'null'} ${meta?.productName ?? 'null'}',
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: defaultMargin / 4,
            ),
            Text(
              data[index].createdAt!.toIso8601String(),
              style: greyTextStyle,
            )
          ],
        ),
        trailing: Text(
          data[index].paymentStatus.toString().toLowerCase().contains('not')
              ? 'Menunggu \nPembayaran'
              : 'Berhasil',
          style: whiteTextStyle.copyWith(
              color: data[index]
                      .paymentStatus
                      .toString()
                      .toLowerCase()
                      .contains('not')
                  ? kDangerColor
                  : kSuccessColor),
        ),
      ),
    );
  }

  Container digitalGoodsContainerWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
      padding: const EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: kBorderRadius,
          boxShadow: [kShadow]),
      child: BlocBuilder<DigitalGoodsCubit, DigitalGoodsState>(
        builder: digitalGoodsBuilderWidget,
      ),
    );
  }

  Widget digitalGoodsBuilderWidget(context, state) {
    if (state is DigitalGoodsSuccess) {
      List<DigitalGoodsProductsModel> prepaidAndPostpaidList = [
        ...state.digitalGoodsData.prepaid!,
        ...state.digitalGoodsData.postpaid!
      ]; //merge prepaid and postpaid products

      return GridViewWidget(data: prepaidAndPostpaidList);
    } else if (state is DigitalGoodsFailed) {
      return const Center(child: Text('fetch product failed'));
    } else if (state is DigitalGoodsLoading) {
      return const GridViewWidget(data: null);
    }
    return const Center(child: Text('no product data'));
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
