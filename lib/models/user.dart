import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String firstName,
    required String lastName,
    required String businessName,
    required String licenseNumber,
    required String location,
    required String email,
    required String phoneNumber,
    String? gender,
    required String profilePictureUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
