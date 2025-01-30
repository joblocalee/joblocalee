import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'settings_model.g.dart';

part 'settings_model.freezed.dart';

@freezed
class SettingsModel with _$SettingsModel {
  @HiveType(typeId: 0, adapterName: 'SettingAdapter')
  const factory SettingsModel({
    @HiveField(0, defaultValue: false) @Default(false) bool isLoggedIn,
    @HiveField(1, defaultValue: '') @Default('') String token,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);
}
