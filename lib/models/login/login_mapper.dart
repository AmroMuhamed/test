
import 'login_response.dart';

class LoginMapper {
  String? data;
  dynamic title;
  dynamic description;

  LoginMapper(
      {required LoginResponse loginResponse,
      this.title,
      this.description,
      this.data}) {
    this.data = loginResponse.data;
  }
}
