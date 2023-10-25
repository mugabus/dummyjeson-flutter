import 'dart:convert';

import 'package:api/repos/product_repo.dart';

import '../model/products.dart';

class ProductController{
  final productRepo =ProductRepo();
  Future<List<Product>>getProduct() async{
    final response =await productRepo.getproduct();
    final data=jsonDecode(response.body);
    List<Product> products =[];
    final productsJson =data['products'];
    for (dynamic productsJson in productsJson){
      products.add(Product.fromJson(productsJson));
    }
    return products;
  }
}