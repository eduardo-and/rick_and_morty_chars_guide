
import '../utils/consts.dart';
import 'package:dio/dio.dart';

class DioConfig {
  final Dio _dio;
  DioConfig({required Dio dio}) : _dio = dio;

  get dio => _dio;

  void init() {
    _dio.options.baseUrl = Constants.apiUrl;
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 10000;
  }
}
