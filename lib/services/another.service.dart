import "package:expenses_tracking_app/services/api.service.dart";

class ExtendedAPI extends API {
  ExtendedAPI(String endpoint) : super(endpoint);

  Future<List<dynamic>> getEveryBody(String endpoint) async {
    try {
      print('======>>${getUrl()}/everybody');
      final response = await dio.get('${getUrl()}/everybody');
      return response.data;
    } catch (error) {
      throw Exception('Failed to get everybody: $error');
    }
  }
}
