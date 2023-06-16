
import 'package:hrapp/Network/api_client.dart';
import 'package:hrapp/Network/dio_helper.dart';
import 'package:hrapp/models/api_state.dart';
class LoginRepository {
  Stream<ApiState> login(
      {required Map<String, dynamic> map}) async* {
    yield LoadingState();
    try {
      print(map);
      final response =
      await ApiClient(DioHelper().getDioWithoutToken()).login(map);

      yield SuccessState([]);
    } catch (e) {
      print(e);
      yield ErrorState(
          message:e.toString(),
          loggerName: '');
    }
  }
}
