class UserModel {
  String? accessToken;
  List<Business>? business;
  String? status;
  Store? store;
  User? user;

  UserModel(
      {this.accessToken, this.business, this.status, this.store, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    if (json['business'] != null) {
      business = <Business>[];
      json['business'].forEach((v) {
        business!.add(Business.fromJson(v));
      });
    }
    status = json['status'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    if (business != null) {
      data['business'] = business!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    if (store != null) {
      data['store'] = store!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Business {
  String? businessPermit;
  int? id;
  int? userId;

  Business({this.businessPermit, this.id, this.userId});

  Business.fromJson(Map<String, dynamic> json) {
    businessPermit = json['business_permit'];
    id = json['id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['business_permit'] = businessPermit;
    data['id'] = id;
    data['user_id'] = userId;
    return data;
  }
}

class Store {
  int? id;
  String? name;
  List<Tags>? tags;

  Store({this.id, this.name, this.tags});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  int? id;
  String? name;

  Tags({this.id, this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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
