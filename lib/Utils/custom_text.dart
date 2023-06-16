import 'package:hrapp/Utils/custom_text_style.dart';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final bool softWrap;
  final CustomTextStyle customTextStyle;

  const CustomText(
      {required this.text,
        required this.customTextStyle,
        this.textAlign = TextAlign.start,
        this.softWrap = true});

  @override
  Widget build(BuildContext context) {
    return customText;
  }

  Text get customText => Text(
    text,
    textAlign: textAlign,
    style: customTextStyle.getStyle(),
    softWrap: softWrap,
  );
}
