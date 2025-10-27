/*
class ShoppingProductModel {
  String? status;
  String? message;
  List<Data>? data;

  ShoppingProductModel({this.status, this.message, this.data});

  ShoppingProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? extraNote;
  String? category;
  Null? brand;
  String? description;
  String? price;
  List<String>? images;
  String? sizes;
  String? averageRating;
  int? totalReviews;
  String? createdAt;
  List<int>? wishers;

  Data(
      {this.id,
        this.name,
        this.extraNote,
        this.category,
        this.brand,
        this.description,
        this.price,
        this.images,
        this.sizes,
        this.averageRating,
        this.totalReviews,
        this.createdAt,
        this.wishers});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extraNote = json['extra_note'];
    category = json['category'];
    brand = json['brand'];
    description = json['description'];
    price = json['price'];
    images = json['images'].cast<String>();
    sizes = json['sizes'];
    averageRating = json['average_rating'];
    totalReviews = json['total_reviews'];
    createdAt = json['created_at'];
    wishers = json['wishers'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['extra_note'] = this.extraNote;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['description'] = this.description;
    data['price'] = this.price;
    data['images'] = this.images;
    data['sizes'] = this.sizes;
    data['average_rating'] = this.averageRating;
    data['total_reviews'] = this.totalReviews;
    data['created_at'] = this.createdAt;
    data['wishers'] = this.wishers;
    return data;
  }
}
*/
class ProductModel {
  String? status;
  String? message;
  List<Product>? data;

  ProductModel({this.status, this.message, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => Product.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class Product {
  int? id;
  String? name;
  String? extraNote;
  String? category;
  Brand? brand;
  String? description;
  String? price;
  List<String>? images;
  String? sizes;
  String? averageRating;
  int? totalReviews;
  String? createdAt;
  List<dynamic>? wishers;

  Product({
    this.id,
    this.name,
    this.extraNote,
    this.category,
    this.brand,
    this.description,
    this.price,
    this.images,
    this.sizes,
    this.averageRating,
    this.totalReviews,
    this.createdAt,
    this.wishers,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      extraNote: json['extra_note'],
      category: json['category'],
      brand:
      json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      description: json['description'],
      price: json['price'],
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      sizes: json['sizes'],
      averageRating: json['average_rating'],
      totalReviews: json['total_reviews'],
      createdAt: json['created_at'],
      wishers: json['wishers'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'extra_note': extraNote,
      'category': category,
      'brand': brand?.toJson(),
      'description': description,
      'price': price,
      'images': images,
      'sizes': sizes,
      'average_rating': averageRating,
      'total_reviews': totalReviews,
      'created_at': createdAt,
      'wishers': wishers,
    };
  }
}

class Brand {
  int? id;
  String? name;
  String? brandImage;

  Brand({this.id, this.name, this.brandImage});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      name: json['name'],
      brandImage: json['brand_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand_image': brandImage,
    };
  }
}
