import '/cubit/digital_goods_query_cubit.dart';

import '/cubit/transaction_cubit.dart';
import '/ui/widgets/list_tile_view_list_builder_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/theme.dart';
import '/ui/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

class PulsaDanDataScreen extends StatefulWidget {
  const PulsaDanDataScreen({super.key});

  @override
  State<PulsaDanDataScreen> createState() => _PulsaDanDataScreenState();
}

class _PulsaDanDataScreenState extends State<PulsaDanDataScreen> {
  final TextEditingController destinationController = TextEditingController();

  @override
  void initState() {
    context
        .read<DigitalGoodsQueryCubit>()
        .filterBrandsByPrefix(destination: destinationController.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: appBarWidget(context),
        body: BlocBuilder<DigitalGoodsQueryCubit, DigitalGoodsQueryState>(
          builder: (context, state) {
            if (state is FilterBrandsByPrefixSuccess) {
              return TabBarView(children: [
                ListTileViewListBuilderWidget(
                  productList: state
                      .filteredBrandsByPrefix.productCategories![0].products,
                ),
                ListTileViewListBuilderWidget(
                  productList: state
                      .filteredBrandsByPrefix.productCategories![1].products,
                )
              ]);
            } else if (state is FilterBrandsByPrefixFailed) {
              return Center(
                child: Text(
                  'Harap Periksa Ulang Nomor Handphonemu',
                  style: blackTextStyle,
                ),
              );
            } else if (state is FilterBrandsByPrefixLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            }
            return TabBarView(
                children: [initialTabViewWidget(), initialTabViewWidget()]);
          },
        ),
      ),
    );
  }

  Widget bodyWidget() {
    return TabBarView(
        children: [initialTabViewWidget(), initialTabViewWidget()]);
  }

  Widget initialTabViewWidget() {
    return SingleChildScrollView(
      child: Column(
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
      ),
    );
  }

  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: kBackgroundColor,
      toolbarHeight: 180,
      title: flexibleSpaceWidget(context),
      bottom: TabBar(
          labelPadding: const EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin / 2),
          indicatorColor: kPrimaryColor,
          labelColor: kBlackColor,
          labelStyle: blackTextStyle,
          tabs: const [Text('Pulsa'), Text('Paket Data')]),
    );
  }

  Column flexibleSpaceWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultMargin,
        ),
        leadingWidget(context),
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
            prefix: BlocBuilder<DigitalGoodsQueryCubit, DigitalGoodsQueryState>(
              builder: (context, state) {
                if (state is FilterBrandsByPrefixSuccess) {
                  return Text(
                    '${state.filteredBrandsByPrefix.name ?? 'Unknown'}  ',
                    style:
                        blackTextStyle.copyWith(fontWeight: FontWeight.normal),
                  );
                } else if (state is FilterBrandsByPrefixLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  );
                }
                return Text(
                  ' ',
                  style: greyTextStyle,
                );
              },
            ),
            title: 'Nomor Telpon',
            controller: destinationController,
            onChanged: (value) {
              TransactionCubit.destination = destinationController.text;
              context.read<DigitalGoodsQueryCubit>().filterBrandsByPrefix(
                  destination: destinationController.text);
            },
          ),
        ),
      ],
    );
  }

  GestureDetector leadingWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
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
