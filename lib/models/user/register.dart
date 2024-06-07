class RegisterModel {
  String? message;
  RegisterUser? user;

  RegisterModel({this.message, this.user});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? RegisterUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class RegisterUser {
  String? businessAddress;
  String? businessName;
  String? businessRegistrationNumber;
  String? email;
  String? firstName;
  String? gender;
  int? id;
  String? lastName;
  String? phoneNumber;
  String? url;

  RegisterUser(
      {this.businessAddress,
      this.businessName,
      this.businessRegistrationNumber,
      this.email,
      this.firstName,
      this.gender,
      this.id,
      this.lastName,
      this.phoneNumber,
      this.url});

  RegisterUser.fromJson(Map<String, dynamic> json) {
    businessAddress = json['business_address'];
    businessName = json['business_name'];
    businessRegistrationNumber = json['business_registration_number'];
    email = json['email'];
    firstName = json['first_name'];
    gender = json['gender'];
    id = json['id'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['business_address'] = businessAddress;
    data['business_name'] = businessName;
    data['business_registration_number'] = businessRegistrationNumber;
    data['email'] = email;
    data['first_name'] = firstName;
    data['gender'] = gender;
    data['id'] = id;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['url'] = url;
    return data;
  }
}
