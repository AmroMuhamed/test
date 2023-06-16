import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrapp/Helpers/styles.dart';

class AppTheme {
  static final AppTheme _appTheme = AppTheme.internal();

  factory AppTheme() {
    return _appTheme;
  }

  AppTheme.internal();

  ThemeData getTheme(context) => lightTheme;

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.dark,
        // textTheme: setAppTextTheme(),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        disabledColor: Styles.GRAY_COLOR,
        hintColor: Styles.HINT_TEXT_COLOR_COLOR,
        unselectedWidgetColor: Styles.TEXT_FORM_FILED_BORDER_COLOR,
        primaryColor: Colors.white,
        primarySwatch: Colors.grey,
        toggleableActiveColor: Styles.DARK_PRIMARY,
        canvasColor: Colors.transparent,
        buttonTheme: _buttonTheme,
        shadowColor: Styles.WHITE_COLOR,
        snackBarTheme: _snackBarThemeData,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  SnackBarThemeData get _snackBarThemeData => const SnackBarThemeData(
        actionTextColor: Styles.WHITE_COLOR,
        backgroundColor: Styles.BLACK_COLOR,
        behavior: SnackBarBehavior.floating,
        elevation: 5.0,
        // contentTextStyle:
        //   RegularStyle(fontSize: 15.0, color: Styles.DARK_PRIMARY).getStyle()
      );

//   setAppTextTheme() {
// //     subtitle1 is used for textFormFiled TextStyle
//     return TextTheme(
//       button: _buttonTextStyle,
//       subtitle1: _subTitleTextStyle,
//       headline1: _headLine1TextStyle,
//       headline2: _headLine2TextStyle,
//     );
//   }

  // TextStyle get _subTitleTextStyle => CustomTextStyle(
  //         textType: TextType.light,
  //         color: darkGreyColor,
  //         fontSize: smallFontSize)
  //     .textStyle;
  //
  // TextStyle get _buttonTextStyle => CustomTextStyle(
  //         textType: TextType.medium,
  //         color: Colors.white,
  //         fontSize: mediumFontSize)
  //     .textStyle;
  //
  // TextStyle get _headLine1TextStyle => CustomTextStyle(
  //         textType: TextType.regular,
  //         color: colorAccent,
  //         fontSize: mediumFontSize)
  //     .textStyle;
  //
  // TextStyle get _headLine2TextStyle => CustomTextStyle(
  //         textType: TextType.regular,
  //         color: colorAccent,
  //         fontSize: mediumFontSize)
  //     .textStyle;

  SystemUiOverlayStyle getSystemUiOverLayStyle(
      {Color color = Styles.BACKGROUND_COLOR,
      Brightness brightness = Brightness.dark}) {
    return SystemUiOverlayStyle(
        statusBarColor: color,
        systemNavigationBarColor: color,
        systemNavigationBarIconBrightness: brightness,
        statusBarIconBrightness: brightness,
        statusBarBrightness: brightness,
        systemNavigationBarDividerColor: color);
  }

  ButtonThemeData get _buttonTheme => ButtonThemeData(
        buttonColor: Styles.DARK_PRIMARY,
        shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(6.0)),
        highlightColor: Styles.DARK_PRIMARY,
        disabledColor: Styles.DARK_PRIMARY,
      );
}
