import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.g.dart';
part 'category_model.freezed.dart';


@freezed
class CategoryModel with _$CategoryModel {

const factory CategoryModel() = _CategoryModel;

factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}