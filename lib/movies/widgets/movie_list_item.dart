import 'package:flutter/material.dart';
import 'package:fourth_dimension/movies/movies.dart';
import 'package:http/http.dart' as http;
import 'package:fourth_dimension/movies/movie/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MoviePage(movie: this.movie))
        ),
        child: ListTile(
            leading: Text('${movie.id}', style: textTheme.caption),
            title: Text(movie.title),
            isThreeLine: true,
            subtitle: Text(movie.body),
            dense: true,
        ),
    );
  }
}
