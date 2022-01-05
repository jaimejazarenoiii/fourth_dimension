import 'package:fourth_dimension/movies/movies.dart';
import 'dart:async';
import 'dart:core';

class MovieRepository {
  Future<List<Movie>> fetchAllMovies() async {
    return Future<List<Movie>>.value([
      Movie(id: 1, title: '123', body: 'zxc'),
      Movie(id: 2, title: '231', body: 'go everyone'),
      Movie(id: 3, title: '124321421', body: 'go everyone2')
    ]);
  }
}
