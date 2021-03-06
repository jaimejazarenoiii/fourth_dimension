import 'package:fourth_dimension/network/freezed/result.dart';
import 'package:fourth_dimension/network/network_options/network_options.dart';
import 'response_decoder.dart';
import 'package:dio/dio.dart';
import '../layers/network_connectivity.dart';
import 'api_request.dart';
import '../interfaces/base_client_generator.dart';
import '../interfaces/base_api_response_model.dart';
import '../freezed/network_error.dart';

class ApiClient {
  static bool debugMode = true;

  static Future<Result<K,NetworkError>> execute<T extends BaseApiResponseModel, K>({required BaseClientGenerator route, required T responseType, NetworkOptions? options}) async {
    if(debugMode) print(route);

    // Check Network Connectivity
    if (await NetworkConnectivity.status) {

      try {
        var response = await ApiRequest.shared.request(route: route,options: options);
        var data = ApiResponseDecoder.shared.decode<T, K>(response: response, responseType: responseType);
        return Result.success(data);

        // NETWORK ERROR
      } on DioError catch (diorError) {
        if(debugMode) print("$route => ${NetworkError.request(error: diorError)}");
        return Result.failure(NetworkError.request(error: diorError));

        // TYPE ERROR
      } on TypeError catch (e) {
        if(debugMode) print("$route => ${NetworkError.type(error: e.toString())}"); 
        return Result.failure(NetworkError.type(error: e.toString()));
      }

      // No Internet Connection
    } else {
      if(debugMode) print(NetworkError.connectivity(message: 'No Internet Connection'));
      return Result.failure(NetworkError.connectivity(message: 'No Internet Connection'));
    }
  }
}
