import 'package:hrapp/Helpers/styles.dart';
import 'package:hrapp/view/loginScreen/login.dart';
import 'package:hrapp/widget/custom_bottom_sheet_dialog.dart';
import 'package:hrapp/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text_style.dart';

class ViewHelper {
  final BuildContext context;
  final bool fullScreen;

  ViewHelper(this.context, {this.fullScreen = false});

  void showDialogWithAnimation(Widget widget) {
    showGeneralDialog(
        context: context,
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: false,
        barrierLabel: '',
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(opacity: a1.value, child: widget),
          );
        },
        pageBuilder: (context, animation1, animation2) => widget);
  }

  void showCustomBottomSheetFullScreen(Widget child,
      {Function(dynamic result)? onUpdate}) {

    showAnimatedDialog(
            context: context,
            builder: (context) => CustomBottomSheetDialog(
                  child: child,
                  fullScreen: fullScreen,
                ),
            curve: Curves.fastOutSlowIn,
            alignment: Alignment.bottomCenter,
            axis: Axis.vertical,
            animationType: DialogTransitionType.slideFromBottomFade,
            duration: Duration(milliseconds: 500),
            barrierDismissible: false,
            barrierColor: Colors.transparent)
        .then((value) {
      if (onUpdate != null) onUpdate(value);
    });
  }

  showSnakeBar(String text,
      {SnackBarAction? action,
      Color snakeColorBackGround = Styles.BLACK_COLOR,
      Color textColor = Colors.white,
      double elevation = 0.0,
      int durationInMilliSeconds = 2000}) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
        alignment: Alignment.center,
        height: 20.h,
        child: CustomText(
          text: text,
          customTextStyle: SemiBoldStyle(fontSize: 14.sp, color: Colors.white),
        ),
      ),
      backgroundColor: snakeColorBackGround,
      elevation: elevation,
      behavior: SnackBarBehavior.floating,
      action: action,
      padding:
          EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 12.h, bottom: 12.h),
      duration: Duration(milliseconds: durationInMilliSeconds),
    ));
  }

  Future<dynamic> pushScreen(dynamic widget, {bool hasBackStack = false}) {
    // TransitionsPage(
    //     child: widget,
    //     context: context,
    //     animation: AnimationType.fadeIn,
    //     duration: Duration(milliseconds: 100),
    //     replacement: hasBackStack);
    if (!hasBackStack)
      return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ));
    else
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ));
  }


  void openLoginScreen() {
    pushScreen(LoginWidget());
  }



}
