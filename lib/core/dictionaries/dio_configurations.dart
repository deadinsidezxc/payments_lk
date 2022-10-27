import 'package:dio/dio.dart';

final baseOptionsV3 = BaseOptions(
  baseUrl: 'https://lk3.variag.ru/api/v3/',
  connectTimeout: 5000,
  receiveTimeout: 5000,
);

final baseOptionsV2 = BaseOptions(
  baseUrl: 'https://lk3.variag.ru/api/v2/',
  connectTimeout: 5000,
  receiveTimeout: 5000,
  headers: {
    "Authorization" : "54a3e26b-14f1-43f9-8b42-f1301f720b6f",
  },
);