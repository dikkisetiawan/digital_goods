import '../../cubit/digital_goods_cubit.dart';
import '/models/goods_model.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class GridViewWidget extends StatefulWidget {
  final List<DigitalGoodsProductsModel>? data;

  const GridViewWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 80,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: defaultMargin / 4,
              mainAxisExtent: defaultMargin * 4,
              mainAxisSpacing: defaultMargin / 4),
          itemCount: 8,
          itemBuilder: (BuildContext ctx, index) {
            return circleIconButtonWidget(ctx, index);
          }),
    );
  }

  Column circleIconButtonWidget(BuildContext context, int index) {
    return Column(
      children: [
        RawMaterialButton(
          onPressed: () {
            DigitalGoodsCubit.selectedProductId = widget.data?[index].id;
            Navigator.pushNamed(context, '/pulsa-data');
          },
          elevation: 2.0,
          fillColor: kGreyColor,
          padding: const EdgeInsets.all(15.0),
          shape: const CircleBorder(),
          child: index == 7
              ? Icon(
                  Icons.grid_on,
                  color: kPrimaryColor,
                  size: defaultMargin,
                )
              : Icon(
                  Icons.shopping_bag,
                  color: kPrimaryColor,
                  size: defaultMargin,
                ),
        ),
        const SizedBox(height: defaultMargin / 2),
        widget.data == null
            ? LinearProgressIndicator(
                color: kPrimaryColor,
              )
            : Text(
                index == 7 ? 'Lainnya' : widget.data![index].name ?? '',
                style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 12.0),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              )
      ],
    );
  }
}
