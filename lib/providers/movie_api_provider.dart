import 'dart:convert';
import 'package:fourth_dimension/network/interfaces/base_api_response_model.dart';
import 'package:fourth_dimension/movies/movies.dart';
import 'package:fourth_dimension/network/layers/api_client.dart';
import '../network/freezed/network_error.dart';
import 'package:fourth_dimension/network/routers/movie_router.dart';
import 'package:fourth_dimension/network/freezed/result.dart';
import 'package:http/http.dart' as http;

class MovieApiProvider {

  final successCode = 200;

  Future<Result<Movies, NetworkError>> fetchAllMovies() async {
    return ApiClient.execute<Movies, Movies>(
      route: MovieRouter.popular(),
      responseType: Movies(results: [], page: 0)
    );
  }
}
