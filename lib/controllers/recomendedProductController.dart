import 'package:foody/helper/data/repository/popularProductRepo.dart';
import 'package:foody/helper/data/repository/recommendedProductRepo.dart';
import 'package:foody/model/productModel.dart';
import 'package:foody/screens/food/recomendedFood.dart';
import 'package:get/get.dart';

class recommendedProductController extends GetxController {
  final recommendedProductRepo productRepo;

  recommendedProductController({required this.productRepo});
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  List<dynamic> _recommendedProduct = [];
  List<dynamic> get recomendedProduct => _recommendedProduct;

  Future<void> getRecommendedProductList() async {
    Response response = await productRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProduct = [];
      _recommendedProduct.addAll(Products.fromJson(response.body)
          .products); // added all the data from api client
      print(_recommendedProduct);
      print("hehehehRecommended");
      _isLoaded = true;
      update();
    } else {
      _isLoaded = false;
    }
  }
}
