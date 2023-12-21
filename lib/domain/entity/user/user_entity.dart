import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

/// Даные пользователя
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    /// id пользователся
    required int id,

    /// email пользователся
    required String email,

    /// имя пользователся
    @JsonKey(name: 'first_name') required String firstName,

    /// фамилия пользователся
    @JsonKey(name: 'last_name') required String lastName,

    /// ссылка на аватар пользовтеля
    required String avatar,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
