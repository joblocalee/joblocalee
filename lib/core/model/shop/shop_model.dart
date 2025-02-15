import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_model.freezed.dart';
part 'shop_model.g.dart';

@freezed
class ShopModel with _$ShopModel{
  const factory ShopModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'shopName') required String shopName,
    @JsonKey(name: 'address') required String address,

  }) = _ShopModel;

  factory ShopModel.fromJson(Map<String, dynamic> json) => _$ShopModelFromJson(json);
}