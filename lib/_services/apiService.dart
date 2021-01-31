import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class ApiService {
 
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://jsonplaceholder.typicode.com",
    responseType: ResponseType.json,
    connectTimeout: 6000,
    receiveTimeout: 8000,
  );
  Dio dio = new Dio(options);
}
