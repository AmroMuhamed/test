import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrapp/Helpers/styles.dart';
import 'package:hrapp/Utils/custom_text.dart';
import 'package:hrapp/Utils/custom_text_style.dart';
import 'package:hrapp/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

Future updateDialogShow(store, local, context, h, w, appStoreLink) {
  return showDialog(
    context: context,
    builder: (context) => WillPopScope(
      child: AlertDialog(
        content: Container(
          height: h * .06,
          alignment: Alignment.center,
          child: CustomText(
            customTextStyle:
                MediumStyle(fontSize: 18.sp, color: Styles.BLACK_COLOR),
            text: 'يجب تحديث التطبيق من نسخة ${store} الى نسخة ${local}',
          ),
        ),
        actions: <Widget>[
          Container(
            width: w * .3,
            alignment: Alignment.center,
            child: InkWell(
              onTap: () async {
                if (await canLaunch(appStoreLink)) {
                  await launch(appStoreLink);
                } else {
                  throw 'Could not launch appStoreLink';
                }
              },
              child: CustomText(
                customTextStyle:
                    BoldStyle(fontSize: 18.sp, color: Styles.BLUE_COLOR_90),
                text: 'تحديث',
              ),
            ),
          ),
        ],
      ),
      onWillPop: () async => false,
    ),
  );
}
