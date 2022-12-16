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
      body: ListView(
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
          Text(
            '00.20.00',
            style: blueTextStyle.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          virtualAccountNumberWidget(),
          const SizedBox(
            height: defaultMargin,
          ),
          Divider(
            color: kGreyColor,
            thickness: 2,
          ),
          amountWidget(),
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
          transactionIdWidget(),
          const SizedBox(
            height: defaultMargin * 4,
          ),
        ],
      ),
    );
  }

  Widget transactionIdWidget() {
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
              '# P102341245',
              style: blackTextStyle,
            ),
            TextButton(
              onPressed: () {},
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

  Widget virtualAccountNumberWidget() {
    return GreyContainerWidget(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        virtualAccountLogoNameWidget(),
        const SizedBox(
          height: defaultMargin,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '0987-9821-2341',
              style: blackTextStyle,
            ),
            TextButton(
              onPressed: () {},
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

  Widget amountWidget() {
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
          'Rp. 16.500',
          style: blueTextStyle.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    ));
  }

  Row virtualAccountLogoNameWidget() {
    return Row(
      children: [
        const FlutterLogo(size: 50.0),
        const SizedBox(
          width: defaultMargin,
        ),
        Column(
          children: [
            Text(
              'Virtual Account BNI',
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
