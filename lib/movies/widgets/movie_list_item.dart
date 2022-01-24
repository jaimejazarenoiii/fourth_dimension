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
            leading: new Container(
                height: 1500,
                width: 100,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/original/${movie.posterPath ?? ''}'),
                        fit: BoxFit.fill,
                    ),
                ),
            ),
            title: Text(movie.title ?? ''),
            isThreeLine: true,
            subtitle: Text(movie.overview ?? ''),
            dense: true,
        ),
    );
  }
}
