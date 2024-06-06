// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      businessName: json['businessName'] as String,
      licenseNumber: json['licenseNumber'] as String,
      location: json['location'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      gender: json['gender'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'businessName': instance.businessName,
      'licenseNumber': instance.licenseNumber,
      'location': instance.location,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'profilePictureUrl': instance.profilePictureUrl,
    };
