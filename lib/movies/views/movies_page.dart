import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_dimension/movies/movies.dart';

class MoviesPage extends StatelessWidget {
  MoviesPage({Key? key, required this.bloc}) : super(key: key);
  final MoviesBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Movies'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Create movie',
                onPressed: () {
                  bloc..add(AddMovie());
                },
            )
          ],
      ),
      body: BlocProvider(
        create: (_) => bloc..add(MoviesFetched()),
        child: MovieList(),
      ),
    );
  }
}
