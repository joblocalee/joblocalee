import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../model/vacancy/vacancy_model.dart';

part 'vacancy_service_dto.freezed.dart';
part 'vacancy_service_dto.g.dart';

@freezed
class VacancyServiceDto with _$VacancyServiceDto{
  const factory VacancyServiceDto({
    @JsonKey(name: 'vacancy') @Default([])List<VacancyModel> vacancy,
  }) = _VacancyServiceDto;

  factory VacancyServiceDto.fromJson(Map<String, dynamic> json) => _$VacancyServiceDtoFromJson(json);
}