import 'package:freezed_annotation/freezed_annotation.dart';

part 'vacancy_model.freezed.dart';
part 'vacancy_model.g.dart';

@freezed
class VacancyModel with _$VacancyModel{
  const factory VacancyModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'thumbnail') required String thumbnail,

  }) = _VacancyModel;

  factory VacancyModel.fromJson(Map<String, dynamic> json) => _$VacancyModelFromJson(json);
}