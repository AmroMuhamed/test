import 'package:hrapp/Utils/constant.dart';
import 'package:hrapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';


final MultiValidator emptyValid = MultiValidator([
  RequiredValidator(errorText: S.current!.required),
]);

final MultiValidator otpValid = MultiValidator([
  RequiredValidator(errorText: S.current!.required),
]);
final MatchValidator matchValid =
    MatchValidator(errorText: 'Not Match Password');

class Validator {


  MultiValidator emptyValidator(BuildContext context) => MultiValidator([
        RequiredValidator(errorText: S.of(context).required),
      ]);


  MatchValidator matchValidator(BuildContext context) =>
      MatchValidator(errorText: 'Not Match Password');

  MultiValidator rangeValidator(BuildContext context, int maxValue,
      String message, {int minValue: 1}) =>
      MultiValidator([
        RequiredValidator(errorText: S.current!.required),
        RangeValidator(
            min: minValue, max: maxValue, errorText: message + ' $maxValue'),
      ]);


  bool notEmptyValid(String? value) => emptyValid.isValid(value);

  bool isOtpValid(String? value) => otpValid.isValid(value);

  isMatchValid(String? value1, String? value2) =>
      matchValid.validateMatch(value1!, value2!);
}
