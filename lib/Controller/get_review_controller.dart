import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Data/models/productModel.dart';
import '../Data/models/review_model.dart' hide Product;


class ApiService {
  static const String baseUrl =
      'https://e-bazar-latest.onrender.com/shoping/products/reviews/13/';

  static Future<Map<String, dynamic>> fetchProductAndReviews() async {
    try {
      final uri = Uri.parse(baseUrl);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        // Parse product
        final Product product = Product.fromJson(jsonData['product']);

        // Parse reviews list
        final List<Review> reviews = (jsonData['reviews'] as List)
            .map((item) => Review.fromJson(item))
            .toList();

        // Return combined data
        return {
          'product': product,
          'reviews': reviews,
        };
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching product and reviews: $e');
    }
  }
}
