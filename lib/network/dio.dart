///  BASE URL  url :|| https://newsapi.org/
///  Method Url   :|| v2/top-headlines
///  not necessary  :|| ?
/// QUERY  map :|| sources=google-news-sa&apiKey=5167789e4b1745ba9062ab58aa152104
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response?> getData(
      String methodUrl,
      Map<String, dynamic> query,
      ) async {
    try{
      return await dio?.get(methodUrl, queryParameters: query);
    }on DioException catch(e){
      print(e.toString());
    }
    return null;
  }
}
