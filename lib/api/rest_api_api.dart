import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:users/api/data/user_response_data.dart';
import 'package:users/api/data/users_response_data.dart';
import 'package:users/api/rest_api_urls.dart';
import 'package:users/domain/entity/user/user_entity.dart';
part 'rest_api_api.g.dart';

/// RestApiApi gateway
@RestApi()
abstract class RestApiApi {
  /// Creates RestApiApi gateway
  factory RestApiApi(Dio dio, {String baseUrl}) = _RestApiApi;

  @GET(RestApiUrls.usersUrl)
  Future<UsersResponseData> getUsers(
    @Query('page') int page,
  );

  @GET(RestApiUrls.userByIdUrl)
  Future<UserResponseData> getUserById(
    @Query('id') int id,
  );
}
