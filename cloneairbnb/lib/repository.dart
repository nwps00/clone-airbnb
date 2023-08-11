import 'dart:convert';
import 'package:airbnbtest/products.dart';
import 'package:http/http.dart' as http;

class ProductsRepository {
  final String url = "https://dummyjson.com/products";

  Future<List<Product>> getListProducts() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print(response.body);
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      // print('jsonmap $jsonMap');
      final List<dynamic> productsData = jsonMap['products'];
      // print('dynamiclist $productsData');
      final List<Product> products = productsData
          .map((productJson) => Product.fromJson(productJson))
          .toList();
      return products;
    } else {
      throw Exception("Failed to load");
    }
  }
}
