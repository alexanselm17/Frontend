// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get productName => throw _privateConstructorUsedError;
  int get leftUnits => throw _privateConstructorUsedError;
  int get productPrice => throw _privateConstructorUsedError;
  String get productImage => throw _privateConstructorUsedError;
  int get productDiscount => throw _privateConstructorUsedError;
  bool get isAnalytics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String productName,
      int leftUnits,
      int productPrice,
      String productImage,
      int productDiscount,
      bool isAnalytics});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? leftUnits = null,
    Object? productPrice = null,
    Object? productImage = null,
    Object? productDiscount = null,
    Object? isAnalytics = null,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      leftUnits: null == leftUnits
          ? _value.leftUnits
          : leftUnits // ignore: cast_nullable_to_non_nullable
              as int,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      productDiscount: null == productDiscount
          ? _value.productDiscount
          : productDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      isAnalytics: null == isAnalytics
          ? _value.isAnalytics
          : isAnalytics // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productName,
      int leftUnits,
      int productPrice,
      String productImage,
      int productDiscount,
      bool isAnalytics});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? leftUnits = null,
    Object? productPrice = null,
    Object? productImage = null,
    Object? productDiscount = null,
    Object? isAnalytics = null,
  }) {
    return _then(_$ProductImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      leftUnits: null == leftUnits
          ? _value.leftUnits
          : leftUnits // ignore: cast_nullable_to_non_nullable
              as int,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      productDiscount: null == productDiscount
          ? _value.productDiscount
          : productDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      isAnalytics: null == isAnalytics
          ? _value.isAnalytics
          : isAnalytics // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  _$ProductImpl(
      {required this.productName,
      required this.leftUnits,
      required this.productPrice,
      required this.productImage,
      required this.productDiscount,
      required this.isAnalytics});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String productName;
  @override
  final int leftUnits;
  @override
  final int productPrice;
  @override
  final String productImage;
  @override
  final int productDiscount;
  @override
  final bool isAnalytics;

  @override
  String toString() {
    return 'Product(productName: $productName, leftUnits: $leftUnits, productPrice: $productPrice, productImage: $productImage, productDiscount: $productDiscount, isAnalytics: $isAnalytics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.leftUnits, leftUnits) ||
                other.leftUnits == leftUnits) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.productDiscount, productDiscount) ||
                other.productDiscount == productDiscount) &&
            (identical(other.isAnalytics, isAnalytics) ||
                other.isAnalytics == isAnalytics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productName, leftUnits,
      productPrice, productImage, productDiscount, isAnalytics);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
      {required final String productName,
      required final int leftUnits,
      required final int productPrice,
      required final String productImage,
      required final int productDiscount,
      required final bool isAnalytics}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get productName;
  @override
  int get leftUnits;
  @override
  int get productPrice;
  @override
  String get productImage;
  @override
  int get productDiscount;
  @override
  bool get isAnalytics;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
