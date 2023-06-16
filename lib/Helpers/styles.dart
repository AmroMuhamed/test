import 'package:flutter/material.dart';

class Styles {
  static const DARK_PRIMARY = Color.fromRGBO(240, 240, 242, 1);
  static const LIGHT_PRIMARY = Color.fromRGBO(240, 240, 242, 1);
  static const BLUE_COLOR_90 = Color.fromRGBO(50, 54, 115, 1);
  static const WHITE_COLOR = Color(0xFFFFFFFF);
  static const BLACK_COLOR = Color(0xFF000000);
  static const GOLD_COLOR = Color(0xFFD4AF37);
  static const BLUE_Color = Color(0xFF181D34);
  static const SHADOW_WHITE_COLOR = Color.fromRGBO(255, 255, 255, 0.68);
  static const MenuColor = Color(0xD4AF372B);
  static const BACKGROUND_COLOR = Colors.white;
  static const HOME_BACKGROUND= Color(0xFFF7F7F7);
  static const GREY_0T_COLOR =Color(0xFFD2D2D2);
  static const GREY_0T_COLOR2 =Color(0xFF6F6F6F);
  static const GREY_0T_COLOR3 =Color(0xffFAFAFA);
  static const GREY_0T_COLOR4=Color(0xFF7B7976);
  static const DIALOG_BACKGROUND_COLOR = Color.fromRGBO(0, 0, 0, 0.7);
  static const GRAY_COLOR = Color(0xFF6D6E70);
  static const GRAY_Divider = Color(0xFFEEEEEE);
  static const HOME_SHADOW_COLOR = Color.fromRGBO(0, 0, 0, 16.0);
  static const CARD1_COLOR = Color(0xFFF8FAF1);
  static const CARD2_COLOR = Color(0xFFF1F8FA);
  static const CARD3_COLOR = Color(0xFFF8F1FA);
  static const CARD1BORDER_COLOR = Color(0xFFE0EBB7);
  static const CARD2BORDER_COLOR = Color(0xFFC3E7F1);
  static const CARD3BORDER_COLOR = Color(0xFFE0C3F1);
  static const CONTAINER_COLOR = Color(0xFFd6d60f);
  static const RED_COLOR = Color.fromRGBO(243, 57, 1, 1);
  static const DISABLED_BUTTON_COLOR = Color.fromRGBO(137, 134, 134, 0.5);
  static const TEXT_FORM_FILED_BORDER_COLOR = Color.fromRGBO(137, 134, 134, 1);
  static const HINT_TEXT_COLOR_COLOR = Color.fromRGBO(137, 134, 134, 0.7);
  static const CARD_GRAY_COLOR = Color(0xFFF8FAF1);
  static const CARD_BORDER_COLOR = Color(0xFFE0EBB7);

  static const TEXT_COLOR = Color.fromRGBO(77, 77, 77, 1);
  static const GREY_COLOR_30_PERCENT = Color.fromRGBO(137, 134, 134, 0.3);
  static const GREY_COLOR_10_PERCENT = Color.fromRGBO(112, 112, 112, 0.1);
  static const GREY_COLOR_50_PERCENT = Color.fromRGBO(137, 134, 134, 0.5);
  static const GREY_COLOR_70_PERCENT = Color.fromRGBO(137, 134, 134, 0.7);
  static const GREY_COLOR_80_PERCENT = Color.fromRGBO(137, 134, 134, 0.8);
  static const LIGHT_GREY_COLOR = Color.fromRGBO(227, 227, 227, 1);
  static const LIGHTER_GREY_COLOR = Color.fromRGBO(251, 251, 251, 1.0);
  static const LIGHT_GREY_COLOR_23_PERCENT = Color.fromRGBO(227, 227, 227, 0.23);
  static const LIGHT_GREY_COLOR_HOUR = Color.fromRGBO(213, 213, 214, 1.0);
  static const BLACK_COLOR_30_PERCENT = Color.fromRGBO(0, 0, 0, 0.16);
  static const BLACK_COLOR_70_PERCENT = Color.fromRGBO(0, 0, 0, 0.7);
  static const BLACK_COLOR_25_PERCENT = Color.fromRGBO(0, 0, 0, 0.14);
  static const BLACK_COLOR_15_PERCENT = Color.fromRGBO(0, 0, 0, 0.15);
  static const BLACK_COLOR_90_PERCENT = Color.fromRGBO(0, 0, 0, 0.19);
  static const SCREEN_PADDING = EdgeInsets.all(24);
  static const CONTAINER_PADDING = EdgeInsets.all(16);
  static const HORIZONTAL_PADDING = EdgeInsets.symmetric(horizontal: 35);
  static const VERTICAL_PADDING = EdgeInsets.symmetric(vertical: 24);
  static const DIVIDER_COLOR = Color.fromRGBO(112, 112, 112, 0.09);
  static const LIGHTER_GREY_COLOR_23_PERCENT = Color.fromRGBO(112, 112, 112, 0.23);
  static const EDIT_PROFILE_CANCEL_BUTTON_COLOR = Color.fromRGBO(246, 78, 96, 1);
  static const BORDER_RADIUS = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)));
  static const BUTTON_BORDER = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)));
  static const CONTAINER_BORDER = BoxDecoration(
    color: Styles.BACKGROUND_COLOR,
    boxShadow: [
      BoxShadow(
        color: Styles.GRAY_COLOR,

        blurRadius: 5,
        offset: Offset(2.0, 2.0), // changes position of shadow
      ),
    ],
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );






}
