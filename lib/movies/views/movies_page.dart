import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/movies/movies.dart';
import 'package:http/http.dart' as http;

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: BlocProvider(
        create: (_) => MoviesBloc(httpClient: http.Client())..add(MoviesFetched()),
        child: MovieList(),
      ),
    );
  }
}
