import 'package:hrapp/Utils/shared_pref_helper.dart';
import 'package:hrapp/bases/button_bloc.dart';
import 'package:hrapp/bases/validator.dart';
import 'package:hrapp/models/api_state.dart';
import 'package:hrapp/models/login/login_mapper.dart';
import 'package:hrapp/repository/authrization/login_repository.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc extends ButtonBloc {
  final _userNumberBehaviour = BehaviorSubject<String>();
  final _passwordBehaviour = BehaviorSubject<String>();
  final Validator _validator = Validator();

  Stream<String> get userNumber => _userNumberBehaviour.stream;

  Stream<String> get password => _passwordBehaviour.stream;

  Function(String) get updateUserNumber => _userNumberBehaviour.sink.add;

  Function(String) get updatePassword => _passwordBehaviour.sink.add;

  @override
  void init() {
    super.init();
  }

  Stream<bool> get validate =>
      Rx.combineLatest2(_userNumberBehaviour, _passwordBehaviour,
          (String email, String password) {
        if (_validator.notEmptyValid(email) ) return true;
        return false;
      });

  bool get isValid =>
      _validator.notEmptyValid(_userNumberBehaviour.value) ;

  Stream<ApiState> loginApiStream(context) {

    return LoginRepository().login(map: {
      "employeeID": _userNumberBehaviour.valueOrNull == null
          ? ''
          : _userNumberBehaviour.value,
      "password": _passwordBehaviour.valueOrNull == null
          ? ''
          : _passwordBehaviour.value,
    } );
  }

  @override
  void dispose() {
    super.dispose();
    _userNumberBehaviour.close();
    _passwordBehaviour.close();
  }
}
