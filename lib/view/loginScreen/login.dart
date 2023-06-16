
import 'package:hrapp/Utils/custom_text_style.dart';
import 'package:hrapp/Utils/shared_pref_helper.dart';
import 'package:hrapp/Utils/view_helper.dart';
import 'package:hrapp/bases/bloc_base.dart';
import 'package:hrapp/bases/validator.dart';
import 'package:hrapp/models/login/login_mapper.dart';
import 'package:hrapp/view/loginScreen/log_in_bloc.dart';
import 'package:hrapp/widget/custom_button.dart';
import 'package:hrapp/widget/custom_text_form_filed.dart';
import 'package:hrapp/Helpers/styles.dart';
import 'package:hrapp/Utils/custom_text.dart';
import 'package:hrapp/bases/base_state.dart';

import 'package:hrapp/generated/l10n.dart';

class LoginWidget extends BaseStatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginWidget> {
  var h, w;

  final SignInBloc _bloc = SignInBloc();
  final Validator _validator = Validator();

  bool rememberMeBool = false;

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }


  @override
  PreferredSizeWidget? appBar() => null;

  @override
  Widget getBody(BuildContext context) =>
      WillPopScope(
          child: blocProvider,
          onWillPop: () async {
            return false;
          });

  BlocProvider get blocProvider {
    h = MediaQuery
        .of(context)
        .size
        .height;
    w = MediaQuery
        .of(context)
        .size
        .width;
    return BlocProvider(child: screenDesign, bloc: _bloc);
  }

  Widget get screenDesign =>
      SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               userNumberTextForm,
              passwordTextForm,
              loginButton,
              signUpButton
            ],
          ));

  StreamBuilder<String> get userNumberTextForm =>
      StreamBuilder(
        builder: (context, snapshot) =>
            Padding(
              padding: EdgeInsets.only(
                  left: w * .04, right: w * .04, top: h * .03),
              child: CustomTextFormFiled(
                labelText: S
                    .of(context)
                    .userNumber,
                onChanged: (value) {
                  _bloc.updateUserNumber(value);
                },
                borderColor: Styles.GREY_0T_COLOR,
                textCapitalization: TextCapitalization.none,
                validator: (value) =>
                    _validator.emptyValidator(context).call(value),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
        stream: _bloc.userNumber,
      );

  StreamBuilder<bool> get passwordTextForm =>
      StreamBuilder<bool>(
        builder: (context, snapshot) => passwordStream(snapshot.data!),
        initialData: false,
        stream: _bloc.passwordVisibilityBehaviour.stream,
      );

  StreamBuilder<String> passwordStream(bool showPassword) =>
      StreamBuilder<String>(
        builder: (context, snapshot) =>
            Padding(
              padding: EdgeInsets.only(
                  left: w * .04, right: w * .04, top: h * .05),
              child: CustomTextFormFiled(
                onChanged: (value) {
                  _bloc.updatePassword(value);
                },
                updatePasswordToggle: (value) {
                  _bloc.passwordVisibilityBehaviour.sink.add(value);
                },
                borderColor: Styles.GREY_0T_COLOR,
                textCapitalization: TextCapitalization.none,
                isPassword: true,
                passwordVisibility: showPassword,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                labelText: S
                    .of(context)
                    .password,
              ),
            ),
        stream: _bloc.password,
        initialData: '',
      );

  Widget get loginButton =>
      Padding(
          padding: EdgeInsets.only(top: h * .01, left: w * .04, right: w * .04),
          child: Center(
            child: CustomButton(
              idleText: S
                  .of(context)
                  .signin,
              buttonColor: Styles.BLACK_COLOR,
              onTap: callLoginApi,
              textSize: 16.sp,
              buttonBehaviour: _bloc.buttonBehavior,
              failedBehaviour: _bloc.failedBehaviour,
              validateStream: _bloc.validate,
            ),
          ));

  Widget text(text, pad, bold) {
    return Padding(
        padding: EdgeInsetsDirectional.only(top: pad),
        child: InkWell(
          onTap: () {
           },
          child: Container(
            width: w,
            alignment: Alignment.center,
            child: CustomText(
                text: text,
                customTextStyle: bold
                    ? BoldStyle(fontSize: 14.sp, color: Styles.GREY_0T_COLOR2)
                    : RegularStyle(
                    fontSize: 14.sp, color: Styles.GREY_0T_COLOR2)),
          ),
        ));
  }

  Widget get signUpButton =>
      Padding(
          padding: EdgeInsets.only(top: h * .01, right: w * .04, left: w * .04),
          child: CustomButton(
            idleText: S
                .of(context)
                .createNewAccount,
            textSize: 16.sp,
            textColor: Styles.WHITE_COLOR,
            onTap: (){},
            buttonColor: Styles.BLUE_COLOR_90,
          ));


  @override
  bool isSafeArea() => false;

  @override
  Future<bool> willPopBack() async => true;

  Future<void> callLoginApi() async {
    if (_bloc.isValid) {
      hideKeyboard(context);
      _bloc.loginApiStream(context).listen((value) async {
        checkResponseStateForButton(value, context,
            failedBehaviour: _bloc.failedBehaviour,
            buttonBehaviour: _bloc.buttonBehavior, onSuccess: () async {


            });
      });
    }
  }
}
