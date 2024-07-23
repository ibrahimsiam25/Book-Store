import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio;
   final _baseUrl = 'https://www.googleapis.com/books/v1/';
  ApiService( Dio dio) : _dio = dio;

  Future<dynamic> get({required String endPoint, @required String? token}) async {
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    Response response = await _dio.get('$_baseUrl$endPoint',
        options: Options(
          headers: headers,
        ));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String endPoint,
      @required dynamic data,
      @required String? token}) async {
    Map<String, dynamic>? headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await _dio.post(
      '$_baseUrl$endPoint',
      options: Options(headers: headers),
      data: data,
    );
     if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> put(
      {required String endPoint,
      @required dynamic data,
      @required String? token}) async {
    Map<String, dynamic>? headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url:$_baseUrl$endPoint ,data:$data ,token:$token');

    Response response = await _dio.post(
      '$_baseUrl$endPoint',
      options: Options(headers: headers),
      data: data,
    );
    print(response.data);
     if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }
}
