
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hrapp/Helpers/styles.dart';
import 'package:hrapp/Utils/app_theme.dart';
import 'package:hrapp/Utils/constant.dart';

import 'package:simple_shared_pref/simple_shared_pref.dart';
import 'package:hrapp/enum/shared_pref_enum.dart';
class AppHelper with ChangeNotifier {
  bool isAppConfigBefore = false;
  static final AppHelper _appModel = AppHelper._internal();
  late SystemUiOverlayStyle systemUiOverlayStyle;

  AppHelper._internal();

  factory AppHelper() {
    return _appModel;
  }

  String get locale => Constant.appLanguage;

  ThemeMode get themeMode => ThemeMode.light;

  get backgroundColor {
    return Styles.WHITE_COLOR;
  }

  Future<void> init() async {
    if (!isAppConfigBefore) {
      // await Firebase.initializeApp();
     await SimpleSharedPref().init();
      // await FirebaseInstallation().init();
      await _initAppLanguage();
      await _initAppThemeMode();
    //  await _initAppNotification();
      systemUiOverlayStyle = AppTheme().getSystemUiOverLayStyle();
    }
    return Future.value();
  }

  Future<void> updateSystemUiOverLayStyle(Color color, Brightness brightness) {
    systemUiOverlayStyle = AppTheme()
        .getSystemUiOverLayStyle(color: Styles.WHITE_COLOR, brightness: brightness);
    notifyListeners();
    return Future.value();
  }

  Future<void> _initAppLanguage() async {
    if (!SimpleSharedPref().contain(key: SharedPrefEnum.language.toString()))
      await SimpleSharedPref()
          .setString(value: 'en', key: SharedPrefEnum.language.toString());
    Constant.appLanguage =
        SimpleSharedPref().getString(key: SharedPrefEnum.language.toString())!;
    return Future.value();
  }


  Future<void> _initAppThemeMode() async {
    if (!SimpleSharedPref().contain(key: SharedPrefEnum.isLight.toString()))
      await SimpleSharedPref()
          .setBool(key: SharedPrefEnum.isLight.toString(), value: true);
    return Future.value();
  }

  Future<bool> changeLanguage(String language, BuildContext context) async {
    try {
      Constant.appLanguage = language;
      await SimpleSharedPref()
          .setString(value: language, key: SharedPrefEnum.language.toString());
      notifyListeners();
      return true;
    } catch (err) {
      return false;
    }
  }

  // Future<bool> changeThemeMode(bool isDarkMode, BuildContext context) async {
  //   try {
  //     Constant.isDarkMode = isDarkMode;
  //     notifyListeners();
  //     return true;
  //   } catch (err) {
  //     return false;
  //   }
  // }

  void doChangeLanguage(String language, BuildContext context) {
    Provider.of<AppHelper>(context, listen: false)
        .changeLanguage(language, context);
  }
}
