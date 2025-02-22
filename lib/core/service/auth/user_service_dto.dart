import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/user/user_model.dart';

part 'user_service_dto.freezed.dart';
part 'user_service_dto.g.dart';

@freezed
class UserServiceDto with _$UserServiceDto {
  const factory UserServiceDto({
    @JsonKey(name: 'user') required UserModel user,
    @JsonKey(name: 'accessToken') required String token,
  }) = _UserServiceDto;

  factory UserServiceDto.fromJson(Map<String, dynamic> json) => _$UserServiceDtoFromJson(json);
}


@freezed
class UserUpdateDto with _$UserUpdateDto {
  const factory UserUpdateDto({
    @JsonKey(name: 'user') required UserModel user,
  }) = _UserUpdateDto;

  factory UserUpdateDto.fromJson(Map<String, dynamic> json) => _$UserUpdateDtoFromJson(json);
}
