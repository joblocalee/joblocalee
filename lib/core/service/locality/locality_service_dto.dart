import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../model/locality/locality_model.dart';
part 'locality_service_dto.g.dart';
part 'locality_service_dto.freezed.dart';

@freezed
class LocalityServiceDto with _$LocalityServiceDto {

const factory LocalityServiceDto({
  @JsonKey(name: 'locality') @Default([])List<LocalityModel> locality,
}) = _LocalityServiceDto;

factory LocalityServiceDto.fromJson(Map<String, dynamic> json) => _$LocalityServiceDtoFromJson(json);
}