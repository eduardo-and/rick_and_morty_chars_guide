import 'package:flutter/material.dart';

import '../utils/consts.dart';
import 'package:dio/dio.dart';

class DioConfig {
  DioConfig() {
    init();
  }
  final Dio _dio = Dio();

  Dio get dio => _dio;

  void init() {
    _dio.options.baseUrl = Constants.apiUrl;
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 10000;
  }
}
