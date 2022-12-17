import '../../models/payment_method_model.dart';
import '/ui/widgets/kapp_bar.dart';
import '/ui/widgets/screen_title.dart';

import '/ui/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PembayaranScreen extends StatelessWidget {
  PembayaranScreen({super.key});

  List<PaymentMethodModel> metodeBayarList = [
    PaymentMethodModel(
        id: 1, name: 'GoPay', type: Type.wallet, imagePath: 'gopay.png'),
    PaymentMethodModel(
        id: 1, name: 'ShopeePay', type: Type.wallet, imagePath: 'gopay.png'),
    PaymentMethodModel(
        id: 1, name: 'Dana', type: Type.wallet, imagePath: 'gopay.png'),
    PaymentMethodModel(
        id: 1, name: 'LinkAja', type: Type.wallet, imagePath: 'gopay.png'),
    PaymentMethodModel(
        id: 1, name: 'Bank BNI', type: Type.va, imagePath: 'gopay.png'),
    PaymentMethodModel(
        id: 1, name: 'Bank BCA', type: Type.va, imagePath: 'gopay.png'),
    PaymentMethodModel(
        id: 1, name: 'Bank Mandiri', type: Type.va, imagePath: 'gopay.png'),
    PaymentMethodModel(
        id: 1, name: 'Indomaret', type: Type.merchant, imagePath: 'gopay.png'),
    PaymentMethodModel(
        id: 1, name: 'Alfamart', type: Type.merchant, imagePath: 'gopay.png'),
    PaymentMethodModel(
        id: 1, name: 'Alfamidi', type: Type.merchant, imagePath: 'gopay.png'),
  ];

  Map<Type, String> typeName = {
    Type.va: 'Virtual Account Bank',
    Type.wallet: 'E-Wallet',
    Type.merchant: 'Merchant'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const KappBar().appBar(context, title: 'Pilih Metode Pembayaran'),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(defaultMargin),
        itemCount: metodeBayarList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return typeTitleWidget(index);
          } else if (metodeBayarList[index].type ==
              metodeBayarList[index - 1].type) {
            return listTileWidget(index);
          } else {
            return typeTitleWidget(index);
          }
        },
      ),
    );
  }

  Padding typeTitleWidget(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultMargin, top: defaultMargin),
      child: Ktitle(
          title: typeName[metodeBayarList[index].type] ?? 'type null',
          fontSize: 16.0),
    );
  }

  Padding listTileWidget(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultMargin / 4),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin / 4),
        tileColor: kGreyColor,
        leading: Image.asset(
          'assets/${metodeBayarList[index].imagePath}',
          height: 30,
        ),
        title: Text(
          metodeBayarList[index].name ?? 'null',
          style: blackTextStyle,
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: kBlackColor,
        ),
        onTap: () {},
      ),
    );
  }
}
