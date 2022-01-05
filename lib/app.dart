import 'package:flutter/material.dart';
import 'movies/movies.dart';
import 'package:fourth_dimension/repositories/movie_repository.dart';

class App extends MaterialApp {
  App() : super(home: MoviesPage(bloc: MoviesBloc(repository: MovieRepository())));
}
