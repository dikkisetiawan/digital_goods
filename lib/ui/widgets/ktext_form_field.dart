import 'package:flutter/material.dart';

import '../theme.dart';

class KtextFormField extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool withTitle;
  final bool editable;
  final Widget? prefix;
  final TextEditingController? controller;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String value)? onChanged;

  const KtextFormField(
      {this.editable = true,
      this.withTitle = true,
      required this.title,
      this.icon,
      super.key,
      this.controller,
      this.prefix,
      this.onFieldSubmitted,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        withTitle
            ? Text(
                title,
                style: blackTextStyle,
              )
            : Container(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          readOnly: editable ? false : true,
          style: blackTextStyle.copyWith(letterSpacing: 0.0),
          decoration: InputDecoration(
              prefix: prefix,
              suffixIcon: icon != null
                  ? Icon(
                      icon,
                      color: kPrimaryColor,
                    )
                  : null,
              filled: true,
              fillColor:
                  editable ? kGreyColor : kDarkGreyColor.withOpacity(0.5),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultCircular - 10),
                  borderSide: BorderSide(color: kDarkGreyColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultCircular - 10),
                  borderSide: BorderSide(color: kDarkGreyColor)),
              hintText: 'Masukkan $title',
              hintMaxLines: 2,
              hintStyle: greyTextStyle.copyWith(
                  fontSize: 14,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold),
              focusColor: kPrimaryColor),
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
