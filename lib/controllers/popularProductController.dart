import 'dart:convert';

import 'package:foody/helper/data/repository/popularProductRepo.dart';
import 'package:foody/model/productModel.dart';
import 'package:get/get.dart';

class popularProductController extends GetxController {
  final popularProductRepo productRepo;

  popularProductController({required this.productRepo});
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  List<dynamic> _popularproduct = [];
  List<dynamic> get popularproduct => _popularproduct;

  Future<void> getPopularProductList() async {
    Response response = await productRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularproduct = [];
      _popularproduct.addAll(Products.fromJson(response.body)
          .products); // added all the data from api client
      // print(_popularproduct);
      //print("heheheh");
      _isLoaded = true;
      update();
    } else {
      _isLoaded = false;
    }
  }
}
