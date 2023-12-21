// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserResponseData _$UserResponseDataFromJson(Map<String, dynamic> json) {
  return _UserResponseData.fromJson(json);
}

/// @nodoc
mixin _$UserResponseData {
  UserEntity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseDataCopyWith<UserResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseDataCopyWith<$Res> {
  factory $UserResponseDataCopyWith(
          UserResponseData value, $Res Function(UserResponseData) then) =
      _$UserResponseDataCopyWithImpl<$Res, UserResponseData>;
  @useResult
  $Res call({UserEntity data});

  $UserEntityCopyWith<$Res> get data;
}

/// @nodoc
class _$UserResponseDataCopyWithImpl<$Res, $Val extends UserResponseData>
    implements $UserResponseDataCopyWith<$Res> {
  _$UserResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get data {
    return $UserEntityCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserResponseDataImplCopyWith<$Res>
    implements $UserResponseDataCopyWith<$Res> {
  factory _$$UserResponseDataImplCopyWith(_$UserResponseDataImpl value,
          $Res Function(_$UserResponseDataImpl) then) =
      __$$UserResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserEntity data});

  @override
  $UserEntityCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserResponseDataImplCopyWithImpl<$Res>
    extends _$UserResponseDataCopyWithImpl<$Res, _$UserResponseDataImpl>
    implements _$$UserResponseDataImplCopyWith<$Res> {
  __$$UserResponseDataImplCopyWithImpl(_$UserResponseDataImpl _value,
      $Res Function(_$UserResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UserResponseDataImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseDataImpl implements _UserResponseData {
  const _$UserResponseDataImpl({required this.data});

  factory _$UserResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseDataImplFromJson(json);

  @override
  final UserEntity data;

  @override
  String toString() {
    return 'UserResponseData(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseDataImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseDataImplCopyWith<_$UserResponseDataImpl> get copyWith =>
      __$$UserResponseDataImplCopyWithImpl<_$UserResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseDataImplToJson(
      this,
    );
  }
}

abstract class _UserResponseData implements UserResponseData {
  const factory _UserResponseData({required final UserEntity data}) =
      _$UserResponseDataImpl;

  factory _UserResponseData.fromJson(Map<String, dynamic> json) =
      _$UserResponseDataImpl.fromJson;

  @override
  UserEntity get data;
  @override
  @JsonKey(ignore: true)
  _$$UserResponseDataImplCopyWith<_$UserResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
