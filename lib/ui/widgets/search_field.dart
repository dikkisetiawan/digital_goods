import 'package:flutter/material.dart';

import '/ui/theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: whiteTextStyle,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.search,
          color: kPrimaryColor,
        ),
        filled: true,
        fillColor: kGreyColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultCircular),
            borderSide: BorderSide(color: kWhiteColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultCircular),
            borderSide: BorderSide(color: kWhiteColor)),
        hintText: 'Search',
        hintStyle: greyTextStyle,
      ),
    );
  }
}
