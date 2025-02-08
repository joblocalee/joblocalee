import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/category/category_model.dart';

part 'category_service_dto.g.dart';
part 'category_service_dto.freezed.dart';


@freezed
class CategoryServiceDto with _$CategoryServiceDto {

const factory CategoryServiceDto({
  @JsonKey(name: 'category') @Default([])List<CategoryModel> category,
}) = _CategoryServiceDto;

factory CategoryServiceDto.fromJson(Map<String, dynamic> json) => _$CategoryServiceDtoFromJson(json);
}