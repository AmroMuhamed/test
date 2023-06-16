import 'package:hrapp/Utils/constant.dart';
import 'package:hrapp/models/header_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(
    baseUrl: Constant.appLive ? Constant.baseDebugUrl : Constant.baseLiveUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @POST('Auth/TakeToken')
  Future<HeaderResponse> login(@Body() Map<String, dynamic> map);

}
