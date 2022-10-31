import 'package:dio/dio.dart';
import 'package:mock_test/model/category_subcategory_model.dart';
import 'package:mock_test/service/dio/dio_client.dart';

class TestService {
  static Future<List<Category>?> MockTestService() async {
    try {
      var response = await DioClient.dio.get("/topics");
      List<Category> data = categoriesModeFromJson(response.data);
      print(data);
      return data;
    } on DioError catch (e) {
      print(e.error);
      return null;
    }
  }
}
