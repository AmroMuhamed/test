
// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hrapp/Helpers/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextForm extends StatefulWidget {
  final double height;
  final double width;
  final String labelText;
  CustomTextForm(
      {Key? key, required this.width,
      required this.height,

      required this.labelText}) : super(key: key);

  @override
  _CustomTextFormState createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  var h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Container(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        style: TextStyle(
            fontFamily: 'Roboto-Regular',
            fontSize: 16.sp,
            color: Styles.BLACK_COLOR),
        decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(
                fontFamily: 'Roboto-Regular',
                fontSize: 16.sp,
                color: Styles.GREY_0T_COLOR),
            counterText: '',
            counterStyle: TextStyle(fontSize: 0),
            filled: true, ),
        onTap: () {},
      ),
    );
  }
}
