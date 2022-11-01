import 'package:dio/dio.dart';
import 'package:mock_test/model/topic_concept_model.dart';
import 'package:mock_test/service/dio/dio_client.dart';

class TestService {
  static Future<List<Topic>?> MockTestService() async {
    try {
      var response = await DioClient.dio.get("/topics");
      List<Topic> data = categoriesModelFromJson(response.data);
      print(data);
      return data;
    } on DioError catch (e) {
      print(e.error);
      return null;
    }
  }
}
