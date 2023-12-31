import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrapp/Helpers/styles.dart';
import 'constant.dart';

abstract class CustomTextStyle {
  final double fontSize;
  final Color color;
  final TextDecoration textDecoration;

  CustomTextStyle(
      {this.fontSize = 15.0,
      this.color = Styles.GRAY_COLOR,
      this.textDecoration = TextDecoration.none});

  TextStyle englishFont(FontWeight fontWeight) {
    return GoogleFonts.roboto(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: textDecoration);
  }

  TextStyle arabicFont(FontWeight fontWeight) {
    return GoogleFonts.tajawal(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: textDecoration);
  }

  bool get isEnglish => Constant.appLanguage == 'en';

  TextStyle getStyle();
}

class LightStyle extends CustomTextStyle {
  @override
  TextStyle getStyle() =>
      isEnglish ? englishFont(FontWeight.w300) : arabicFont(FontWeight.w300);

  LightStyle(
      {double fontSize = 15,
      Color color = Styles.GRAY_COLOR,
      TextDecoration textDecoration = TextDecoration.none})
      : super(color: color, fontSize: fontSize, textDecoration: textDecoration);
}

class RegularStyle extends CustomTextStyle {
  @override
  TextStyle getStyle() =>
      isEnglish ? englishFont(FontWeight.w400) : arabicFont(FontWeight.w400);

  RegularStyle(
      {double fontSize = 15,
      Color color = Styles.GRAY_COLOR,
      TextDecoration textDecoration = TextDecoration.none})
      : super(color: color, fontSize: fontSize, textDecoration: textDecoration);
}

class MediumStyle extends CustomTextStyle {
  @override
  TextStyle getStyle() =>
      isEnglish ? englishFont(FontWeight.w500) : arabicFont(FontWeight.w500);

  MediumStyle(
      {double fontSize = 15,
      Color color = Styles.GRAY_COLOR,
      TextDecoration textDecoration = TextDecoration.none})
      : super(color: color, fontSize: fontSize, textDecoration: textDecoration);
}

class SemiBoldStyle extends CustomTextStyle {
  @override
  TextStyle getStyle() =>
      isEnglish ? englishFont(FontWeight.w600) : arabicFont(FontWeight.w600);

  SemiBoldStyle(
      {double fontSize = 15,
      Color color = Styles.GRAY_COLOR,
      TextDecoration textDecoration = TextDecoration.none})
      : super(color: color, fontSize: fontSize, textDecoration: textDecoration);
}

class BoldStyle extends CustomTextStyle {
  @override
  TextStyle getStyle() =>
      isEnglish ? englishFont(FontWeight.w700) : arabicFont(FontWeight.w700);

  BoldStyle(
      {double fontSize = 15,
      Color color = Styles.GRAY_COLOR,
      TextDecoration textDecoration = TextDecoration.none})
      : super(color: color, fontSize: fontSize, textDecoration: textDecoration);
}
