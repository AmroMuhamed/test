import 'dart:io';

import 'package:hrapp/Utils/app_color.dart';
import 'package:hrapp/Utils/custom_text_style.dart';
import 'package:hrapp/Utils/view_helper.dart';
import 'package:hrapp/Widget/custom_progress.dart';
import 'package:hrapp/Widget/custom_text.dart';
import 'package:hrapp/bases/response_handler.dart';
import 'package:hrapp/generated/l10n.dart';
import 'package:hrapp/models/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:provider/provider.dart';

export 'package:flutter/material.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T>
    with RouteAware, ResponseHandLer {
  bool useCustomScaffold = false;
  Color? customBackgroundColor;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late ProgressDialog _progressDialog;

  var h, w;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> willPopBack();

  bool isSafeArea();

  PreferredSizeWidget? appBar();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    _initProgressDialog();
    return Consumer<AppHelper>(
      builder: (context, value, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: value.systemUiOverlayStyle,
        child: useCustomScaffold
            ? _defaultBody
            : WillPopScope(
                onWillPop: willPopBack,
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor: customBackgroundColor == null
                      ? value.backgroundColor
                      : customBackgroundColor,
                  appBar: appBar(),
                  body: isSafeArea()
                      ? SafeArea(child: _defaultBody)
                      : _defaultBody,
                  drawerScrimColor: Colors.transparent,

                  // )
                ),
              ),
      ),
    );
  }

  Widget get _defaultBody => GestureDetector(
        child: getBody(context),
        onTap: () => hideKeyboard(context),
      );

  Widget getBody(BuildContext context);

  void hideKeyboard(BuildContext context) {
    if (Platform.isIOS || Platform.isAndroid)
      FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<dynamic> pushScreen(dynamic widget, {bool hasBackStack = false}) {
    FocusScope.of(context).requestFocus(FocusNode());
    return ViewHelper(context).pushScreen(widget, hasBackStack: hasBackStack);
  }

  void popBack({dynamic result}) {
    hideKeyboard(context);
    Navigator.pop(context, result);
  }

  showSnakeBar(String text,
      {SnackBarAction? action,
      Color snakeColorBackGround = primaryColor,
      Color textColor = Colors.white,
      double elevation = 0.0,
      int durationInSecond = 2}) {
    ViewHelper(context).showSnakeBar(text,
        elevation: elevation,
        action: action,
        durationInMilliSeconds: durationInSecond,
        snakeColorBackGround: snakeColorBackGround,
        textColor: textColor);
  }

  void showCustomBottomSheet(Widget child,
      {Function(dynamic result)? onUpdate}) {
   }

  Widget getDataContainer(
          {required Widget child, Color containerColor = whiteColor}) =>
      Container(
        // margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
        ),
        child: child,
      );

  Widget getDataCard(
          {required Widget child, Color containerColor = whiteColor}) =>
      Card(
        color: whiteColor,
        elevation: 4.r,
        shadowColor: lightGreyColor10Percent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: child,
      );

  Widget getAnimatedSwitcher(Widget child, bool showed) => AnimatedSwitcher(
        child: showed ? child : Container(),
        duration: Duration(milliseconds: 200),
        transitionBuilder: (child, animation) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );

  void _initProgressDialog() {
    _progressDialog = ProgressDialog(context,
        showLogs: true, isDismissible: true, type: ProgressDialogType.normal);
    _initProgressDialogStyle();
  }

  void _initProgressDialogStyle() {
    _progressDialog.style(
        progressWidget: CustomProgress(
          size: 50.r,
        ),
        elevation: 3.r,
        borderRadius: 5.r,
        insetAnimCurve: Curves.fastLinearToSlowEaseIn,
        backgroundColor: whiteColor,
        message: S.of(context).pleaseWait,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        messageTextStyle:
            SemiBoldStyle(color: blackColor70Percent, fontSize: 18.sp)
                .getStyle(),
        progressTextStyle:
            SemiBoldStyle(color: blackColor70Percent, fontSize: 18.sp)
                .getStyle(),
        progressWidgetAlignment: Alignment.center,
        widgetAboveTheDialog: CustomText(
          text: S.of(context).loading,
          customTextStyle: SemiBoldStyle(color: blackColor, fontSize: 18.sp),
        ),
        textAlign: TextAlign.center);
  }

  void showProgressDialog() {
    if (!_progressDialog.isShowing()) _progressDialog.show();
  }

  void hideProgress() {
    if (_progressDialog.isShowing()) _progressDialog.hide();
  }
}
