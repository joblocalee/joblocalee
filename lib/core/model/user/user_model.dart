import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @HiveType(typeId: 1, adapterName: 'UserAdapter')
  const factory UserModel({
    @HiveField(0)@JsonKey(name: 'name') required String name,
    @HiveField(1)@JsonKey(name: 'email') required String email,
    @HiveField(2)@JsonKey(name: 'phone') required String phone,
    @HiveField(3)@JsonKey(name: 'address') required String address,
    @HiveField(4)@JsonKey(name: 'locality') required String locality,
    @HiveField(5)@JsonKey(name: 'gender') required String gender,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
