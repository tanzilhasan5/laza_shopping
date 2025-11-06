/*
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  var isLoading = false.obs;


  static Future<void> signUp(String name, String email, String phone, String address ,) async {
    final uri = Uri.parse('https://91cc7bf224a0.ngrok-free.app/subscription/create-checkout-session/');


    try {
      final headers = {'Content-Type': 'application/json'};

      final body = jsonEncode({
        "name": name,
        "email": email,
        "phone": phone,
        "address": address
      });

      final response = await http.post(uri, headers: headers, body: body);

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        print(' SignUp Successful: $jsonResponse');



      } else {
        print(' SignUp Failed: ${response.statusCode}');
      }
    } catch (e) {
      print(' Error during signup: $e');
    }
  }
}
*/
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../ui/screen/CartScreen/payment_web_view.dart';

class PaymentController extends GetxController {
  var isLoading = false.obs;

  Future<void> fatchPayment(String name, String email, String phone, String address) async {
    final uri = Uri.parse('https://91cc7bf224a0.ngrok-free.app/subscription/create-checkout-session/');

    isLoading(true);

    try {
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
      });

      final response = await http.post(uri, headers: headers, body: body);

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');


      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        print('$jsonResponse.[url]');
        Get.to(() => PaymentWebView(url: jsonResponse['url']));

      } else {
        print(' SignUp Failed: ${response.statusCode}');
      }
    } catch (e) {
      print(' Error during signup: $e');
    } finally {

      isLoading(false);
    }
  }
}

