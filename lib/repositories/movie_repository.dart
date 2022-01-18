import 'package:fourth_dimension/movies/movies.dart';
import 'package:fourth_dimension/providers/movie_api_provider.dart';
import 'package:fourth_dimension/network/freezed/result.dart';
import '../network/freezed/network_error.dart';
import 'dart:async';
import 'dart:core';

class MovieRepository {
  MovieApiProvider _movieApiProvider = MovieApiProvider();

  Future<Result<Movies, NetworkError>> fetchAllMovies() => _movieApiProvider.fetchAllMovies();
}
