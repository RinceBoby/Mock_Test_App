import 'package:dio/dio.dart';

class DioClient {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl:
          "https://utkwwq6r95.execute-api.us-east-1.amazonaws.com/assignment",
      headers: {
        'userid': '25794905-2dd4-40bd-97b9-9d5d69294b86',
        'token': 'd61036c6-5ffd-4964-b7ff-8d5ba8ca0262',
      },
    ),
  );
}
