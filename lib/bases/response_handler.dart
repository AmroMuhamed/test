import 'package:hrapp/Helpers/styles.dart';
import 'package:hrapp/Utils/app_color.dart';
import 'package:hrapp/Utils/custom_text_style.dart';
import 'package:hrapp/Utils/view_helper.dart';
import 'package:hrapp/Widget/custom_dialog.dart';
import 'package:hrapp/Widget/custom_progress.dart';
import 'package:hrapp/Widget/custom_text.dart';
import 'package:hrapp/generated/l10n.dart';
import 'package:hrapp/models/api_state.dart';
import 'package:custom_progress_button/custom_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

class ResponseHandLer {
  dynamic checkResponseState(
    ApiState apiState,
    BuildContext context, {
    double loaderSize = 50,
    Color loaderColor = blackColor,
    double noDataFoundSize = 18,
    String? noDataFoundText,
    bool? noProduct,
    Widget? noProductWidget,
    bool isUseExpanded = false,
    Widget? onSuccess,
    Widget? idleWidget,
  }) {
    if (apiState is LoadingState)
      return isUseExpanded
          ? getExpanded(getCustomProgress(
              loaderColor: loaderColor, loaderSize: loaderSize))
          : getCustomProgress(loaderColor: loaderColor, loaderSize: loaderSize);
    else if (apiState is SuccessState)
      return onSuccess;
    else if (apiState is FailedState)
      return getNoDataFound(context,
          textColor: loaderColor,
          noDataFoundText: noDataFoundText,
          noProduct: noProduct ?? false,
          noProductWidget: noProductWidget,
          isUseExpanded: isUseExpanded);
    else if (apiState is ErrorState)
      return getErrorText(apiState.error.toString());
    else if (apiState is IdleState)
      return idleWidget;
    else
      return isUseExpanded
          ? getExpanded(getCustomProgress(
              loaderColor: loaderColor, loaderSize: loaderSize))
          : getCustomProgress(loaderColor: loaderColor, loaderSize: loaderSize);
  }

  void checkResponseStateForButton(ApiState apiState, BuildContext context,
      {VoidCallback? onSuccess,
      required BehaviorSubject<String> failedBehaviour,
      required BehaviorSubject<ButtonState> buttonBehaviour}) {
    if (apiState is LoadingState)
      buttonBehaviour.sink.add(ButtonState.loading);
    else if (apiState is SuccessState) {
      buttonBehaviour.sink.add(ButtonState.success);
      onSuccess!();
    } else if (apiState is ErrorState) {
      buttonBehaviour.sink.add(ButtonState.idle);
      showErrorDialog(apiState.message, context);
      // failedBehaviour.sink.add(apiState.message);
    } else {
      buttonBehaviour.sink.add(ButtonState.idle);
      showErrorDialog(apiState.message, context);
      // failedBehaviour.sink.add(apiState.message);
    }
  }

  void showErrorDialog(String message, BuildContext context,
      {String? errorMessage}) {
    ViewHelper(context).showCustomBottomSheetFullScreen(CustomAppDialog(
      headerString: errorMessage != null ? errorMessage : S.of(context).error,
      headerTextColor: redColor,
      descriptionString: message,
      positiveClick: () {},
      positiveString: S.of(context).ok,
      negativeString: '',
    ));
  }

  Widget getCustomProgress({
    double loaderSize = 50,
    Color loaderColor = blackColor,
  }) =>
      CustomProgress(
        color: loaderColor,
        size: loaderSize,
      );

  Widget getExpanded(Widget child) => Expanded(child: child);

  Widget getErrorText(String error) {
    return Container(
        color: Colors.red,
        child: Center(
          child: Expanded(
            child: CustomText(
              text: error,
              customTextStyle: RegularStyle(color: redColor, fontSize: 15.sp),
            ),
          ),
        ));
  }

  getNoDataFound(BuildContext context,
      {Color textColor = primaryColor,
      String? noDataFoundText,
      required bool noProduct,
      Widget? noProductWidget,
      bool isUseExpanded = true}) {
    return isUseExpanded
        ? Expanded(
            flex: 1,
            child: noDataFound(
                textColor: textColor,
                noDataFoundText: noDataFoundText == null
                    ? S.of(context).noDataFound
                    : noDataFoundText),
          )
        : noProduct
            ? noProductWidget
            : noDataFound(
                noDataFoundText: noDataFoundText == null
                    ? S.of(context).noDataFound
                    : noDataFoundText,
                textColor: textColor);
  }

  Widget noDataFound(
          {String? noDataFoundText, Color textColor = primaryColor}) =>
      Center(
        child: CustomText(
          text:
              noDataFoundText == null ? S.current!.noDataFound : noDataFoundText,
          customTextStyle: BoldStyle(fontSize: 20.sp, color: Styles.BLUE_COLOR_90),
        ),
      );
}
