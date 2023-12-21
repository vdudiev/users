import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users/domain/entity/user/user_entity.dart';
part 'users_response_data.freezed.dart';
part 'users_response_data.g.dart';

/// Data класс ответа, который содержит в себе список пользователей
@freezed
class UsersResponseData with _$UsersResponseData {
  const factory UsersResponseData({
    required List<UserEntity> data,
  }) = _UsersResponseData;

  factory UsersResponseData.fromJson(Map<String, dynamic> json) => _$UsersResponseDataFromJson(json);
}
