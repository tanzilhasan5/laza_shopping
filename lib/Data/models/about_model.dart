class AboutUsModel {
  bool? success;
  String? message;
  List<AboutData>? data;

  AboutUsModel({this.success, this.message, this.data});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AboutData>[];
      json['data'].forEach((v) {
        data!.add(AboutData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AboutData {
  int? id;
  String? heading;
  String? description;

  AboutData({this.id, this.heading, this.description});

  AboutData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    description = json['discription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['heading'] = heading;
    map['discription'] = description;
    return map;
  }
}