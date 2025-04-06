import 'package:dio/dio.dart';
import 'package:reck_morty/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }

Future<List<dynamic>> getAllCharacters() async {
    try {
      final response = await dio.get('https://rickandmortyapi.com/api/character');
  return response.data['results'];
      
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }
}
