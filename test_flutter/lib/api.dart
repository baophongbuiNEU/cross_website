import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio();

  static Future<Response<dynamic>?> fetchData() async {
    try {
      final response = await _dio.get('http://10.0.2.2:8080/db/postgresql');
      return response;
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      return null; // Avoid returning an exception directly
    }
  }
}
