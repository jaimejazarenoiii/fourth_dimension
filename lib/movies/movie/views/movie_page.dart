import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_dimension/movies/movie/movie.dart';
import 'package:fourth_dimension/movies/movies.dart';
import 'package:http/http.dart' as http;

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
        create: (_) => MovieBloc(httpClient: http.Client(), movie:
            this.movie)..add(MovieFetched()),
        child: Text('${movie.title}')
    );
  }
}
