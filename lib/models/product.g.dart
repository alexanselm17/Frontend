// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productName: json['productName'] as String,
      leftUnits: (json['leftUnits'] as num).toInt(),
      productPrice: (json['productPrice'] as num).toInt(),
      productImage: json['productImage'] as String,
      productDiscount: (json['productDiscount'] as num).toInt(),
      isAnalytics: json['isAnalytics'] as bool,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'leftUnits': instance.leftUnits,
      'productPrice': instance.productPrice,
      'productImage': instance.productImage,
      'productDiscount': instance.productDiscount,
      'isAnalytics': instance.isAnalytics,
    };
