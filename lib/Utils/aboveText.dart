
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrapp/Helpers/styles.dart';
import 'package:hrapp/Utils/custom_text.dart';
import 'package:hrapp/Utils/custom_text_style.dart';

Widget aboveText(h,w,text){
  return Padding(
      padding: EdgeInsetsDirectional.only(start: w * .04, top: h * .04),
      child: Container(
        child: CustomText(
          text: text,
          customTextStyle:
          BoldStyle(fontSize: 16.sp, color: Styles.BLUE_COLOR_90),
        ),
      ));
}