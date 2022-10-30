import 'package:dio/dio.dart';

class DioClient {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl:
          "https://utkwwq6r95.execute-api.us-east-1.amazonaws.com/assignment",
      headers: {
        'userid': 'uId',
        'token': 'token',
      },
    ),
  );
}
