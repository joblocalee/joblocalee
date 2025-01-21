import 'package:freezed_annotation/freezed_annotation.dart';

part 'locality_model.g.dart';
part 'locality_model.freezed.dart';

@freezed
class LocalityModel with _$LocalityModel {
  const factory LocalityModel() = _LocalityModel;

  factory LocalityModel.fromJson(Map<String, dynamic> json) => _$LocalityModelFromJson(json);
}
