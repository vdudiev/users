import 'package:dio/dio.dart';
import 'package:users/api/rest_api_api.dart';
import 'package:users/domain/entity/user/user_entity.dart';
import 'package:users/domain/repositories/user_data_repository.dart';

/// Репозитрий работы с данными пользователей через rest api
class UsersDataRepositoryImpl implements IUsersDataRepository {
  final RestApiApi _api;

  UsersDataRepositoryImpl(Dio dio) : _api = RestApiApi(dio);

  /// Колбэк получения списка пользователей
  @override
  Future<List<UserEntity>> getUsers({required int page}) async {
    var respnse = await _api.getUsers(page);
    return respnse.data;
  }

  @override
  Future<UserEntity> getUserById(int id) async {
    var response = await _api.getUserById(id);

    return response.data;
  }
}
