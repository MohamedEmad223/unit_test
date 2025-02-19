import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test/get_list/api_services/api_services.dart';

import 'api_services_test.mocks.dart';



@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late ApiServices apiServices;

  setUp(() {
    mockDio = MockDio();
    apiServices = ApiServices(mockDio);
  });

  group('ApiServices', () {
    test('fetchPosts should return a list of PostsModel', () async {
      when(mockDio.get('https://jsonplaceholder.typicode.com/posts'))
          .thenAnswer(
        (_) async => Response(
          data: [
            {
              'id': 1,
              'title': 'Title 1',
              'body': 'Body 1',
            },
            {
              'id': 2,
              'title': 'Title 2',
              'body': 'Body 2',
            },
          ],
          statusCode: 200,
          requestOptions: RequestOptions(
              path: 'https://jsonplaceholder.typicode.com/posts'),
        ),
      );

      final posts = await apiServices.fetchPosts();

      expect(posts.length, 2);
      expect(posts[0].id, 1);
      expect(posts[0].title, 'Title 1');
      expect(posts[0].body, 'Body 1');
      expect(posts[1].id, 2);
      expect(posts[1].title, 'Title 2');
      expect(posts[1].body, 'Body 2');
    });

    test('fetchPosts should throw an exception if the response is not 200',
        () async {
      when(mockDio.get('https://jsonplaceholder.typicode.com/posts'))
          .thenAnswer(
        (_) async => Response(
            data: [],
            statusCode: 404,
            requestOptions: RequestOptions(
                path: 'https://jsonplaceholder.typicode.com/posts')),
      );

      expect(apiServices.fetchPosts(), throwsException);
    });

    test('fetchPosts should throw an exception if an error occurs', () async {
      when(mockDio.get('https://jsonplaceholder.typicode.com/posts'))
          .thenThrow(Exception('Failed to load posts'));

      expect(apiServices.fetchPosts(), throwsException);
    });
  });
}
