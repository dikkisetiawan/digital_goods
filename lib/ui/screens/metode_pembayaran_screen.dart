import 'package:digital_goods/cubit/transaction_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/payment_method_model.dart';
import '/ui/widgets/kapp_bar.dart';
import '/ui/widgets/screen_title.dart';

import '/ui/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MetodePembayaranScreen extends StatefulWidget {
  const MetodePembayaranScreen({super.key});

  @override
  State<MetodePembayaranScreen> createState() => _MetodePembayaranScreenState();
}

class _MetodePembayaranScreenState extends State<MetodePembayaranScreen> {
  Map<Type, String> typeName = {
    Type.va: 'Virtual Account Bank',
    Type.wallet: 'E-Wallet',
    Type.merchant: 'Merchant'
  };

  @override
  void initState() {
    context.read<TransactionCubit>().fetchPaymentMethodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const KappBar().appBar(context, title: 'Pilih Metode Pembayaran'),
      body: BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is FetchPaymentMethodListFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: kDangerColor,
                content: Text(
                  state.error,
                  style: whiteTextStyle,
                ),
              ),
            );
          } else if (state is CreateTransactionSuccess) {
            Navigator.pushNamed(context, '/kode-pembayaran');
          } else if (state is CreateTransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: kDangerColor,
                content: Text(
                  state.error,
                  style: whiteTextStyle,
                ),
              ),
            );
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is FetchPaymentMethodListSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(defaultMargin),
              itemCount: state.paymentMethodList.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return typeTitleWidget(state.paymentMethodList[index]);
                } else if (state.paymentMethodList[index].type ==
                    state.paymentMethodList[index - 1].type) {
                  return listTileWidget(state.paymentMethodList[index]);
                } else {
                  return typeTitleWidget(state.paymentMethodList[index]);
                }
              },
            );
          } else if (state is TransactionLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            ));
          }
          return Center(
              child: Text(
            'Gagal fetch metode bayar',
            style: blackTextStyle,
          ));
        },
      ),
    );
  }

  Padding typeTitleWidget(PaymentMethodModel paymentMethod) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultMargin, top: defaultMargin),
      child: Ktitle(
          title: typeName[paymentMethod.type] ?? 'type null', fontSize: 16.0),
    );
  }

  Padding listTileWidget(PaymentMethodModel paymentMethod) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultMargin / 4),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin / 4),
        tileColor: kGreyColor,
        leading: Image.asset(
          'assets/${paymentMethod.imagePath ?? 'gopay.png'}',
          height: 30,
        ),
        title: Text(
          paymentMethod.name ?? 'null',
          style: blackTextStyle,
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: kBlackColor,
        ),
        onTap: () {
          context.read<TransactionCubit>().createTransaction();
        },
      ),
    );
  }
}
