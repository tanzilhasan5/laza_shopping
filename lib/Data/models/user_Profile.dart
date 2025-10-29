class UserProfile {
  bool? success;
  String? message;
  UserData? data;

  UserProfile({this.success, this.message, this.data});

  UserProfile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['success'] = success;
    dataMap['message'] = message;
    if (data != null) {
      dataMap['data'] = data!.toJson();
    }
    return dataMap;
  }
}

class UserData {
  String? firstName;
  String? email;
  String? phone;
  String? country;
  String? city;
  String? address;
  String? image;

  UserData({
    this.firstName,
    this.email,
    this.phone,
    this.country,
    this.city,
    this.address,
    this.image,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['first_name'] = firstName;
    dataMap['email'] = email;
    dataMap['phone'] = phone;
    dataMap['country'] = country;
    dataMap['city'] = city;
    dataMap['address'] = address;
    dataMap['image'] = image;
    return dataMap;
  }
}
