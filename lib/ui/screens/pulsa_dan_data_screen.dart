import '../widgets/list_tile_view_list_builder_widget.dart';
import '/ui/theme.dart';
import '/ui/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

class PulsaDanDataScreen extends StatelessWidget {
  const PulsaDanDataScreen({super.key});

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
    return TabBarView(
        children: [ListTileViewListBuilderWidget(), initialTabViewWidget()]);
  }

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin / 2),
          child:
              KtextFormField(withTitle: false, title: 'Masukkan Nomor Telpon'),
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
