import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/vacancy/vacancy_model.dart';
import '../../model/category/category_model.dart';

part 'home_service_dto.g.dart';
part 'home_service_dto.freezed.dart';

@freezed
class GetHomeResponseDto with _$GetHomeResponseDto {
  const factory GetHomeResponseDto({
    @JsonKey(name: 'vacancy') required List<VacancyModel> vacancy,
    @JsonKey(name: 'category') required List<CategoryModel> category,
  }) = _GetHomeResponseDto;

  factory GetHomeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetHomeResponseDtoFromJson(json);
}