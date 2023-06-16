import 'package:hrapp/Helpers/styles.dart';
import 'package:hrapp/Utils/app_color.dart';
import 'package:hrapp/Utils/custom_text_style.dart';
import 'package:hrapp/Utils/image_const.dart';
import 'package:hrapp/Utils/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_loader/image_helper.dart';

class CustomTextFormFiled extends StatelessWidget {
  final bool enableInteractiveSelection;
  final Color? borderColor;
  final Color? fillColor;
  final VoidCallback? onTap;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final Widget? suffixIcon, prefixIcon;
  final Key? key;
  final Function(bool isDenes)? updatePasswordToggle;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool enable;
  final bool expanded;
  final bool isPassword;
  final bool passwordVisibility;
  final String labelText;
  final bool isLabel;
  final bool isDense;
  final bool readOnly;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsets? customContentPadding;
  final bool usedInAppBar;
  final int? minLines, maxLines;
  final bool hasContentPadding;
  final FocusNode? focusNode;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final bool showCounter;
  final bool enableBorder;
  final String? initialValue;
  final TextCapitalization? textCapitalization;


  CustomTextFormFiled(
      {required this.labelText,
      this.enableInteractiveSelection = true,
      this.onTap,
      this.textEditingController,
      this.onChanged,
      this.errorText,
      this.prefixIcon,
      this.key,
      this.suffixIcon,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.enable = true,
      this.expanded = false,
      this.isPassword = false,
      this.isLabel = false,
      this.isDense = false,
      this.passwordVisibility = false,
      this.readOnly = false,
      this.updatePasswordToggle,
      this.customContentPadding,
      this.onFieldSubmitted,
      this.validator,
      this.usedInAppBar = false,
      this.minLines,
      this.hasContentPadding = true,
      this.focusNode,
      this.autoFocus = false,
      this.inputFormatter,
      this.borderColor,
      this.fillColor,
      this.showCounter = true,
      this.maxLength,
      this.enableBorder = true,
      this.maxLines,
      this.initialValue,
      this.textCapitalization});

  @override
  Widget build(BuildContext context) => _textFormFiled;

  Widget get _textFormFiled => TextFormField(
        onTap: onTap,
        style: _defaultTextStyle,
        initialValue: initialValue,

        textInputAction: textInputAction,
        cursorColor: primaryColor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textCapitalization: textCapitalization == null
            ? TextCapitalization.sentences
            : textCapitalization!,
        showCursor: !readOnly,
        controller: textEditingController,
        keyboardType: keyboardType,
        enabled: enable,
        // focusNode: focusNode == null ? FocusNode() : focusNode,
        enableInteractiveSelection: enableInteractiveSelection,
        expands: expanded,
        autofocus: autoFocus,
        maxLength: maxLength,
        inputFormatters: inputFormatter,
        keyboardAppearance:
            SharedPRefHelper().isLight ? Brightness.light : Brightness.dark,
        maxLines: isPassword
            ? 1
            : passwordVisibility
                ? 1
                : maxLines,
        validator: (value) => validator == null ? null : validator!(value),
        obscureText: passwordVisibility,
        readOnly: readOnly,
        onChanged: (value) => onChanged != null ? onChanged!(value) : null,
        minLines: isPassword
            ? 1
            : minLines != null
                ? minLines
                : null,
        decoration: _inputDecoration,
        // onFieldSubmitted: (value) => onFieldSubmitted!(value),
      );

  InputDecoration get _inputDecoration => InputDecoration(
        errorStyle: _errorTextStyle,
        errorMaxLines: 4,
        contentPadding: hasContentPadding
            ? customContentPadding == null
                ? EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 13.0, bottom: 13.0)
                : customContentPadding
            : null,
        errorText: errorText,
        enabled: enable,
        counterText: '',
        counterStyle: _counterTextStyle,
        hintStyle: _hintTextStyle,
        helperStyle: _counterTextStyle,
        labelStyle: _labelTextStyle,
        isDense: isDense,
        fillColor: fillColor == null ? Styles.WHITE_COLOR : fillColor,
        filled: true,
        // fillColor: usedInAppBar ? Colors.white : Colors.transparent,
        // filled: usedInAppBar,
        suffixIcon: isPassword ? Container() : suffixIcon,
        prefixIcon: prefixIcon,
        labelText: !isLabel ? labelText : null,
        hintText: isLabel ? labelText : null,
        border: _getBorder(usedInAppBar
            ? lightGreyColor9Percent
            : enableBorder
                ? greyColor
                : whiteColor),
        disabledBorder: _getBorder(usedInAppBar
            ? lightGreyColor9Percent
            : enableBorder
                ? greyColor
                : whiteColor),
        enabledBorder: _getBorder(usedInAppBar
            ? lightGreyColor9Percent
            : enableBorder
                ? greyColor
                : whiteColor),
        errorBorder: _getBorder(redColor),
        focusedBorder: _getBorder(usedInAppBar
            ? lightGreyColor9Percent
            : enableBorder
                ? greyColor
                : whiteColor),
        focusedErrorBorder: _getBorder(redColor),
      );

  Widget loadVisibilityIcon(String path) => ImageHelper(
        image: path,
        imageType: ImageType.svg,
        boxFit: BoxFit.fill,
      );

  TextStyle get _counterTextStyle => RegularStyle(
          color: usedInAppBar ? greyColor70Percent : blackColor,
          fontSize: 18.sp)
      .getStyle();

  TextStyle get _errorTextStyle =>
      RegularStyle(color: redColor, fontSize: 16.sp).getStyle();

  TextStyle get _hintTextStyle => RegularStyle(
          color: usedInAppBar ? greyColor70Percent : greyColor70Percent,
          fontSize: 18.sp)
      .getStyle();

  TextStyle get _defaultTextStyle =>
      RegularStyle(color: Styles.BLACK_COLOR, fontSize: 18.sp).getStyle();

  TextStyle get _labelTextStyle =>
      BoldStyle(color: Styles.BLUE_COLOR_90, fontSize: 18.sp,).getStyle();

  InputBorder? _getBorder(Color color) => usedInAppBar
      ? UnderlineInputBorder(borderSide: BorderSide(color: color, width: 1.0))
      : getOutLineBorder(color);

  InputBorder getOutLineBorder(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
          color: borderColor == null ? color : borderColor!, width: 1.0));
}
