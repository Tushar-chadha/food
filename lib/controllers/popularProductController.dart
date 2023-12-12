import 'package:foody/helper/data/repository/popularProductRepo.dart';
import 'package:get/get.dart';

class popularProductController extends GetxController {
  final popularProductRepo productRepo;

  popularProductController({required this.productRepo});

  List<dynamic> _popularproduct = [];
  List<dynamic> get popularproduct => _popularproduct;

  Future<void> getPopularProductList() async {
    Response response = await productRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularproduct = [];
      //_popularproduct.addAll();
      update();
    } else {}
  }
}
