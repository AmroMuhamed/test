import 'package:hrapp/Utils/app_color.dart';
import 'package:hrapp/Utils/custom_text_style.dart';
import 'package:custom_progress_button/custom_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button.dart';
import 'custom_text.dart';

class CustomAppDialog extends StatelessWidget {
  // final String imagePath;
  final String headerString;
  final String descriptionString;
  final bool singleClick;
  final VoidCallback positiveClick;
  final VoidCallback? negativeClick;
  final String positiveString;
  final String negativeString;
  late final BuildContext _context;
  final Color headerTextColor;

  CustomAppDialog(
      {
      // this.imagePath = hrappBlockLogo,
      required this.headerString,
      required this.descriptionString,
      this.singleClick = true,
      required this.positiveClick,
      this.negativeClick,
      required this.negativeString,
      required this.positiveString,
      this.headerTextColor = blackColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return screenDesign;
  }

  Widget get screenDesign => defaultDialogDesign;

  Widget get defaultDialogDesign => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (headerString.isNotEmpty)
            SizedBox(
              height: 30.h,
            ),
          if (headerString.isNotEmpty) headerText,
          SizedBox(
            height: 38.h,
          ),
          descriptionText,
          SizedBox(
            height: 32.h,
          ),
          buttonRow,
          SizedBox(
            height: 30.h,
          ),
        ],
      );

  Widget get headerText => Center(
        child: CustomText(
          text: headerString,
          customTextStyle: RegularStyle(color: blackColor, fontSize: 18.sp),
        ),
      );

  Widget get descriptionText => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomText(
            text: descriptionString,
            customTextStyle: RegularStyle(color: blackColor, fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
      );

  Widget get buttonRow => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            if (!singleClick)
              Expanded(
                    child: CustomButton(
                onTap: cancel,
                idleText: negativeString,
                textSize: 18.sp,
                buttonShapeEnum: ButtonShapeEnum.outline,
                textColor: blackColor,
              )),
            SizedBox(
              width: 14.w,
            ),
            Expanded(
                child: CustomButton(
              onTap: confirm,
              idleText: positiveString,
              textSize: 18.sp,
              buttonShapeEnum: ButtonShapeEnum.elevated,
            )),
          ],
        ),
      );

  void confirm() {
    Navigator.pop(_context);
    positiveClick();
  }

  void cancel() {
    Navigator.pop(_context);
    if (negativeClick != null) negativeClick!();
  }
}
