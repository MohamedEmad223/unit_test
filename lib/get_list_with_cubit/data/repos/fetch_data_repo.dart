import 'package:dio/dio.dart';
import 'package:unit_test/get_list/model/posts_model.dart';

class FetchDataRepo {
  final Dio _dio;

  FetchDataRepo(this._dio);

  Future<List<PostsModel>> fetchList() async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data['title'];
  }
}
