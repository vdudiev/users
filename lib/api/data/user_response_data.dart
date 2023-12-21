import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users/domain/entity/user/user_entity.dart';
part 'user_response_data.freezed.dart';
part 'user_response_data.g.dart';

/// Data класс ответа, который содержит в себе список пользователей
@freezed
class UserResponseData with _$UserResponseData {
  const factory UserResponseData({
    required UserEntity data,
  }) = _UserResponseData;

  factory UserResponseData.fromJson(Map<String, dynamic> json) => _$UserResponseDataFromJson(json);
}
