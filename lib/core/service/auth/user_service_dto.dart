import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/user/user_model.dart';

part 'user_service_dto.freezed.dart';
part 'user_service_dto.g.dart';

@freezed
class UserServiceDto with _$UserServiceDto {
  const factory UserServiceDto({
    @JsonKey(name: 'user') required UserModel user,
  }) = _UserServiceDto;

  factory UserServiceDto.fromJson(Map<String, dynamic> json) => _$UserServiceDtoFromJson(json);
}