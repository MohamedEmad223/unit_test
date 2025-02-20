import 'package:dio/dio.dart';

class FetchDataRepo {
  final Dio _dio;

  FetchDataRepo(this._dio);

  Future<String> fetchList() async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data['title'];
  }
}
