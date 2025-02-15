import 'package:freezed_annotation/freezed_annotation.dart';

import '../shop/shop_model.dart';

part 'vacancy_model.freezed.dart';
part 'vacancy_model.g.dart';

@freezed
class VacancyModel with _$VacancyModel{
  const factory VacancyModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'positionName') required String title,
    @JsonKey(name: 'jobDescription') required String jobDescription,
    @JsonKey(name: 'qualification') required String qualification,
    @JsonKey(name: 'experience') required String experience,
    @JsonKey(name: 'contact') required String contact,
    @JsonKey(name: 'salary') required String salary,
    @JsonKey(name: 'timing') required String timing,
    @JsonKey(name: 'shops') required ShopModel shops,

  }) = _VacancyModel;

  factory VacancyModel.fromJson(Map<String, dynamic> json) => _$VacancyModelFromJson(json);
}