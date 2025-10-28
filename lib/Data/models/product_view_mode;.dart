class ProductViewModel {
  String? status;
  String? message;
  List<Data>? data;

  ProductViewModel({this.status, this.message, this.data});

  ProductViewModel.fromJson(Map<String, dynamic> json) {
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
  String? brand;
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
