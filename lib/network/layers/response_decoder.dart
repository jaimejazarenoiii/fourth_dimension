import 'package:dio/dio.dart';
import '../interfaces/base_api_response_model.dart';

class ApiResponseDecoder {

  static var shared = ApiResponseDecoder();

  K decode<T extends BaseApiResponseModel, K>({required Response<dynamic> response, required T responseType}) {
    try {
      if (response.data is List) {
        var list = response.data as List;
        var dataList = List<T>.from(list.map((item) => responseType.fromJson(item)).toList()) as K;
        return dataList;
      } else {
        var data = responseType.fromJson(response.data) as K;
        return data;
      }
    } on TypeError catch (e) {
      throw e;
    }
  }
}
