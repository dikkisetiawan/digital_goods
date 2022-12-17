import 'package:digital_goods/models/goods_model.dart';
import 'package:digital_goods/ui/widgets/kelevated_button.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ListTileViewListBuilderWidget extends StatelessWidget {
  final List<ProductModel>? productList;

  const ListTileViewListBuilderWidget({
    Key? key,
    this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: productList!.length,
      itemBuilder: (context, index) {
        return itemTileWidget(context, index);
      },
    );
  }

  Widget itemTileWidget(
    BuildContext context,
    int index,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: defaultMargin),
          child: ListTile(
            onTap: () {},
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productList?[index].name ?? 'no name',
                  style: blackTextStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: defaultMargin / 4,
                ),
                Text(
                  'Rp. ${productList?[index].price.toString() ?? 'no price'}',
                  style: greyTextStyle,
                ),
              ],
            ),
            trailing: SizedBox(
              width: 80,
              child: KelevatedButton(
                  onPressed: () {
                    showModalBottomSheetWidget(context);
                  },
                  title: 'Beli'),
            ),
          ),
        ),
        Divider(
          color: kDarkGreyColor.withOpacity(0.5),
          thickness: 1,
        )
      ],
    );
  }

  Future<void> showModalBottomSheetWidget(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 4,
          padding: const EdgeInsets.all(defaultMargin),
          color: kBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Bayar',
                    style: blackTextStyle,
                  ),
                  Text(
                    'Rp 16.500',
                    style: buttonTextStyle.copyWith(fontSize: 18),
                  )
                ],
              ),
              ListTile(
                leading: Icon(
                  Icons.discount,
                  color: kPrimaryColor,
                ),
                title: Text(
                  'Gunakan voucher',
                  style: blackTextStyle,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: kBlackColor,
                ),
              ),
              KelevatedButton(
                title: 'Pilih Metode Pembayaran',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
