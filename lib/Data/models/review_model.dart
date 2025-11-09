class ProductReviewModel {
  final int id;
  final String name;
  final String brandImage;

  ProductReviewModel({required this.id, required this.name, required this.brandImage});

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) {
    return ProductReviewModel(
      id: json['id'],
      name: json['name'],
      brandImage: json['brand_image'] ?? '',
    );
  }
}

class Product {
  final int id;
  final String name;
  final String category;
  final String description;
  final String price;
  final String sizes;
  final double averageRating;
  final int totalReviews;
  final List<String> images;
  final ProductReviewModel brand;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.sizes,
    required this.averageRating,
    required this.totalReviews,
    required this.images,
    required this.brand,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      price: json['price'],
      sizes: json['sizes'],
      averageRating: double.parse(json['average_rating']),
      totalReviews: json['total_reviews'],
      images: List<String>.from(json['images']),
      brand: ProductReviewModel.fromJson(json['brand']),
    );
  }
}

class User {
  final int id;
  final String firstName;
  final String email;
  final String image;

  User({required this.id, required this.firstName, required this.email, required this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      email: json['email'],
      image: json['image'] ?? '',
    );
  }
}

class Review {
  final int id;
  final User user;
  final double rating;
  final String comment;

  Review({required this.id, required this.user, required this.rating, required this.comment});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      user: User.fromJson(json['user']),
      rating: double.parse(json['rating']),
      comment: json['comment'],
    );
  }
}
