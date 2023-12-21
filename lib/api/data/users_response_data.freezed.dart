// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersResponseData _$UsersResponseDataFromJson(Map<String, dynamic> json) {
  return _UsersResponseData.fromJson(json);
}

/// @nodoc
mixin _$UsersResponseData {
  List<UserEntity> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersResponseDataCopyWith<UsersResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersResponseDataCopyWith<$Res> {
  factory $UsersResponseDataCopyWith(
          UsersResponseData value, $Res Function(UsersResponseData) then) =
      _$UsersResponseDataCopyWithImpl<$Res, UsersResponseData>;
  @useResult
  $Res call({List<UserEntity> data});
}

/// @nodoc
class _$UsersResponseDataCopyWithImpl<$Res, $Val extends UsersResponseData>
    implements $UsersResponseDataCopyWith<$Res> {
  _$UsersResponseDataCopyWithImpl(this._value, this._then);

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
              as List<UserEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersResponseDataImplCopyWith<$Res>
    implements $UsersResponseDataCopyWith<$Res> {
  factory _$$UsersResponseDataImplCopyWith(_$UsersResponseDataImpl value,
          $Res Function(_$UsersResponseDataImpl) then) =
      __$$UsersResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserEntity> data});
}

/// @nodoc
class __$$UsersResponseDataImplCopyWithImpl<$Res>
    extends _$UsersResponseDataCopyWithImpl<$Res, _$UsersResponseDataImpl>
    implements _$$UsersResponseDataImplCopyWith<$Res> {
  __$$UsersResponseDataImplCopyWithImpl(_$UsersResponseDataImpl _value,
      $Res Function(_$UsersResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UsersResponseDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersResponseDataImpl implements _UsersResponseData {
  const _$UsersResponseDataImpl({required final List<UserEntity> data})
      : _data = data;

  factory _$UsersResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersResponseDataImplFromJson(json);

  final List<UserEntity> _data;
  @override
  List<UserEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'UsersResponseData(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersResponseDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersResponseDataImplCopyWith<_$UsersResponseDataImpl> get copyWith =>
      __$$UsersResponseDataImplCopyWithImpl<_$UsersResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersResponseDataImplToJson(
      this,
    );
  }
}

abstract class _UsersResponseData implements UsersResponseData {
  const factory _UsersResponseData({required final List<UserEntity> data}) =
      _$UsersResponseDataImpl;

  factory _UsersResponseData.fromJson(Map<String, dynamic> json) =
      _$UsersResponseDataImpl.fromJson;

  @override
  List<UserEntity> get data;
  @override
  @JsonKey(ignore: true)
  _$$UsersResponseDataImplCopyWith<_$UsersResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
