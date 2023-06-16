import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Utils/app_theme.dart';
import 'Utils/constant.dart';
import 'generated/l10n.dart';
import 'models/app_helper.dart';

class MyApp extends StatefulWidget {
  final Widget startWidget;

  MyApp({required this.startWidget});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: Platform.isIOS ? Size(420, 780) : Size(420, 780),
    builder: (context , child) {
      return changeNotifierProvider;
    },
  );

  ChangeNotifierProvider<AppHelper> get changeNotifierProvider =>
      ChangeNotifierProvider<AppHelper>.value(
          value: AppHelper(),
          child: Consumer<AppHelper>(
            builder: (context, value, child) => mediaQuery(context),
          ));

  MediaQuery mediaQuery(BuildContext context) =>
      MediaQuery(data: MediaQueryData(), child: materialApp(context));

  MaterialApp materialApp(BuildContext context) => MaterialApp(
    // scrollBehavior: CustomScrollBehavior(),
    debugShowCheckedModeBanner: Constant.appLive,
    title: 'hrapp',
    theme: AppTheme().getTheme(context),
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,

    ],
    locale: Locale(Provider.of<AppHelper>(context).locale, ''),
    supportedLocales: S.delegate.supportedLocales,
    home: widget.startWidget,
    themeMode: AppHelper().themeMode,
  );
}
