import 'package:foody/utils/constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token; // token to access server
  final String appBaseUrl; //base api url

  late Map<String, String> _mainHeader;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = constants.token;
    _mainHeader = {
      "content-type": "application/json; charset=UTF-8 ",
      "Authorization": "Bearer $token"
    };
  } // key value pairs

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri); // get() is from getx

      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
