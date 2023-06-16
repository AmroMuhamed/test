import 'package:hrapp/enum/shared_pref_enum.dart';
import 'package:simple_shared_pref/simple_shared_pref.dart';

class SharedPRefHelper {
  bool get isLight =>
      SimpleSharedPref().getBool(key: SharedPrefEnum.isLight.toString())!;

  String get userId {
    if (SimpleSharedPref().contain(key: SharedPrefEnum.userId.toString()))
      return SimpleSharedPref().getString(key: SharedPrefEnum.userId.toString())!;
    return '';
  }


  String get getBearerToken {
    if (SimpleSharedPref().contain(key: SharedPrefEnum.bearerToken.toString()))
      return SimpleSharedPref()
          .getString(key: SharedPrefEnum.bearerToken.toString())!;
    return '';
  }

  String get getLanguage {
    if (SimpleSharedPref().contain(key: SharedPrefEnum.language.toString()))
      return SimpleSharedPref()
          .getString(key: SharedPrefEnum.language.toString())!;
    return '';
  }

  void setUserId(String userId) {
    SimpleSharedPref()
        .setString(value: userId, key: SharedPrefEnum.userId.toString());
  }

  void setBearerToken(String value) {
    SimpleSharedPref()
        .setString(key: SharedPrefEnum.bearerToken.toString(), value: value);
  }



  void setDarkMode(bool value) {
    SimpleSharedPref()
        .setBool(key: SharedPrefEnum.isLight.toString(), value: value);
  }

  void setLanguage(String value) {
    SimpleSharedPref()
        .setString(key: SharedPrefEnum.language.toString(), value: value);
  }



}
