import 'package:dio/dio.dart';

class API {
  final Dio dio;
  final String endpoint;

  API(this.endpoint) : dio = Dio() {
    dio.options.headers['Content-Type'] = 'application/json';
    // Add any other headers here, e.g., authentication token
    // dio.options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
  }

  String getUrl() {
    // dio.options.headers['Authorization'] = 'Bearer $token';
    return 'http://0.0.0.0:8000/$endpoint';
  }

  Future<List<dynamic>> getAll() async {
    try {
      final response = await dio.get(getUrl());
      return response.data;
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }

  Future<Map<String, dynamic>> getById(String endpoint, int id) async {
    try {
      final response = await dio.get('${getUrl()}/$id');
      return response.data;
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }

  Future<void> delete(String endpoint, int id) async {
    try {
      final response = await dio.delete('${getUrl()}/$id');
      if (response.statusCode != 204) {
        throw Exception('Failed to delete data');
      }
    } catch (error) {
      throw Exception('Failed to delete data: $error');
    }
  }

  Future<Map<String, dynamic>> create(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(getUrl(), data: data);
      return response.data;
    } catch (error) {
      throw Exception('Failed to create data: $error');
    }
  }

  Future<Map<String, dynamic>> update(
      String endpoint, int id, Map<String, dynamic> data) async {
    try {
      final response = await dio.put('${getUrl()}/$id', data: data);
      return response.data;
    } catch (error) {
      throw Exception('Failed to update data: $error');
    }
  }
}
