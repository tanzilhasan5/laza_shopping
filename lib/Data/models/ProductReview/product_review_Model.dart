import 'dart:convert';

class ProductReviewModel {
  final bool? success;
  final String? message;
  final Product? product;
  final List<Review>? reviews;

  ProductReviewModel({
    this.success,
    this.message,
    this.product,
    this.reviews,
  });

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) {
    return ProductReviewModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      product: json['product'] != null ? Product.fromJson(json['product']) : null,
      reviews: (json['reviews'] as List?)
          ?.map((e) => Review.fromJson(e))
          .toList(),
    );
  }

  get rating => null;

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'product': product?.toJson(),
      'reviews': reviews?.map((e) => e.toJson()).toList(),
    };
  }

  static ProductReviewModel fromRawJson(String str) =>
      ProductReviewModel.fromJson(jsonDecode(str));

  String toRawJson() => jsonEncode(toJson());
}

class Product {
  final int? id;
  final String? name;
  final String? extraNote;
  final String? category;
  final Brand? brand;
  final String? description;
  final String? price;
  final List<String>? images;
  final String? sizes;
  final String? averageRating;
  final int? totalReviews;
  final String? createdAt;
  final List<int>? wishers;

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
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      extraNote: json['extra_note'] ?? '',
      category: json['category'] ?? '',
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      description: json['description'] ?? '',
      price: json['price']?.toString() ?? '0.0',
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : [],
      sizes: json['sizes'] ?? '',
      averageRating: json['average_rating']?.toString() ?? '0',
      totalReviews: json['total_reviews'] ?? 0,
      createdAt: json['created_at'] ?? '',
      wishers: json['wishers'] != null
          ? List<int>.from(json['wishers'])
          : [],
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
  final int? id;
  final String? name;
  final String? brandImage;

  Brand({
    this.id,
    this.name,
    this.brandImage,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      brandImage: json['brand_image'] ?? '',
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

class Review {
  final int? id;
  final ReviewUser? user;
  final double? rating;
  final String? comment;
  final String? createdAt;

  Review({
    this.id,
    this.user,
    this.rating,
    this.comment,
    this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? 0,
      user: json['user'] != null ? ReviewUser.fromJson(json['user']) : null,
      rating: double.tryParse(json['rating']?.toString() ?? '0.0') ?? 0.0,
      comment: json['comment'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user?.toJson(),
      'rating': rating,
      'comment': comment,
      'created_at': createdAt,
    };
  }
}

class ReviewUser {
  final int? id;
  final String? firstName;
  final String? email;
  final String? phone;
  final String? country;
  final String? city;
  final String? address;
  final String? image;

  ReviewUser({
    this.id,
    this.firstName,
    this.email,
    this.phone,
    this.country,
    this.city,
    this.address,
    this.image,
  });

  factory ReviewUser.fromJson(Map<String, dynamic> json) {
    return ReviewUser(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      address: json['address'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'email': email,
      'phone': phone,
      'country': country,
      'city': city,
      'address': address,
      'image': image,
    };
  }
}
