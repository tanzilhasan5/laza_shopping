
class BrandsModel {
  bool? success;
  String? message;
  List<BrandData>? data;

  BrandsModel({this.success, this.message, this.data});

  BrandsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BrandData>[];
      json['data'].forEach((v) {
        data!.add(BrandData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrandData {
  int? id;
  String? name;
  String? brandImage;

  BrandData({this.id, this.name, this.brandImage});

  BrandData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brandImage = json['brand_image']; // ✅ correctly maps snake_case → camelCase
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['brand_image'] = brandImage;
    return data;
  }
}
