import 'package:digital_goods/cubit/transaction_cubit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import '../widgets/grey_container_widget.dart';
import '/ui/theme.dart';
import '/ui/widgets/kapp_bar.dart';
import 'package:flutter/material.dart';

class KodePembayaranScreen extends StatelessWidget {
  const KodePembayaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const KappBar().appBar(context, title: 'Pembayaran'),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is GeneratePaymentCodeSuccess) {
          return listViewWidget(state);
        }
        return Text(
          'Gagal Create Kode Bayar',
          style: blackTextStyle,
        );
      },
    );
  }

  ListView listViewWidget(GeneratePaymentCodeSuccess state) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(defaultMargin),
      children: [
        Text(
          'Lakukan transfer ke rekening virtual akun untuk menyelesaikan pembayaran',
          style: blackTextStyle.copyWith(fontWeight: FontWeight.normal),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: defaultMargin,
        ),
        Text(
          'Selesaikan Pembayaran Sebelum',
          style: blackTextStyle.copyWith(fontWeight: FontWeight.normal),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: defaultMargin / 3,
        ),
        Center(
          child: CountdownTimer(
            endTime: state.generatedPaymentCode.virtualAccountInfo!
                .expiredDateUtc!.millisecondsSinceEpoch,
            widgetBuilder: (context, time) {
              if (time == null) {
                return Text(
                  'Waktu Habis',
                  style: blackTextStyle,
                );
              }
              return Text(
                'Hari: ${time.days ?? 0}, Jam: ${time.hours ?? 0} , Menit: ${time.min ?? 0}, Detik: ${time.sec ?? 0}',
                style: blueTextStyle,
              );
            },
          ),
        ),
        virtualAccountNumberWidget(state),
        const SizedBox(
          height: defaultMargin,
        ),
        Divider(
          color: kGreyColor,
          thickness: 2,
        ),
        amountWidget(state),
        const SizedBox(
          height: defaultMargin / 4,
        ),
        infoWidget(),
        const SizedBox(
          height: defaultMargin,
        ),
        Divider(
          color: kGreyColor,
          thickness: 2,
        ),
        transactionIdWidget(state),
        const SizedBox(
          height: defaultMargin * 4,
        ),
      ],
    );
  }

  Widget transactionIdWidget(GeneratePaymentCodeSuccess state) {
    return GreyContainerWidget(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ID Transaksi',
          style: blackTextStyle.copyWith(fontWeight: FontWeight.normal),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              state.generatedPaymentCode.order?.invoiceNumber ?? 'null',
              style: blackTextStyle,
            ),
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(
                    text: state.generatedPaymentCode.order?.invoiceNumber ??
                        'null'));
              },
              child: Text('Salin',
                  style: buttonTextStyle.copyWith(
                    decoration: TextDecoration.underline,
                  )),
            )
          ],
        ),
        Text(
          'Simpan ID Transaksi ini apabila terjadi kendala pada transaksi kamu',
          style: blackTextStyle.copyWith(fontWeight: FontWeight.normal),
        )
      ],
    ));
  }

  Row infoWidget() {
    return Row(
      children: [
        Icon(
          Icons.info,
          color: kDarkGreyColor,
        ),
        const SizedBox(
          width: defaultMargin / 2,
        ),
        Text(
          'Pastikan nominal yang anda transfer sesuai',
          style: greyTextStyle,
        )
      ],
    );
  }

  Widget virtualAccountNumberWidget(GeneratePaymentCodeSuccess state) {
    return GreyContainerWidget(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        virtualAccountLogoNameWidget(state),
        const SizedBox(
          height: defaultMargin,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              state.generatedPaymentCode.virtualAccountInfo
                      ?.virtualAccountNumber ??
                  'null',
              style: blackTextStyle,
            ),
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(
                    text: state.generatedPaymentCode.virtualAccountInfo
                            ?.virtualAccountNumber ??
                        'null'));
              },
              child: Text('Salin',
                  style: buttonTextStyle.copyWith(
                    decoration: TextDecoration.underline,
                  )),
            )
          ],
        ),
      ],
    ));
  }

  Widget amountWidget(GeneratePaymentCodeSuccess state) {
    return GreyContainerWidget(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Nominal Transfer',
          style: blackTextStyle,
        ),
        const SizedBox(
          height: defaultMargin / 4,
        ),
        Text(
          'Rp. ${state.generatedPaymentCode.order?.amount ?? 'null'}',
          style: blueTextStyle.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    ));
  }

  Row virtualAccountLogoNameWidget(GeneratePaymentCodeSuccess state) {
    return Row(
      children: [
        const FlutterLogo(size: 50.0),
        const SizedBox(
          width: defaultMargin,
        ),
        Column(
          children: [
            Text(
              state.generatedPaymentCode.virtualAccountInfo!
                      .virtualAccountName ??
                  'null',
              style: blackTextStyle,
            ),
            const SizedBox(
              height: defaultMargin / 4,
            ),
            Text(
              'A.N Kawisata',
              style: blackTextStyle.copyWith(fontWeight: FontWeight.normal),
            )
          ],
        )
      ],
    );
  }
}
