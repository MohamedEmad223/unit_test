import 'package:unit_test/get_list/model/posts_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  ApiServices(this.dio);

  Future<List<PostsModel>> fetchPosts() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((post) => PostsModel.fromJson(post)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (error) {
      throw Exception('Failed to load posts: $error');
    }
  }
}
