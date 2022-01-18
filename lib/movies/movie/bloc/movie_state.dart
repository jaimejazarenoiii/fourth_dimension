part of 'movie_bloc.dart';

enum MovieStatus { initial, success, failure }

class MovieState extends Equatable {
  const MovieState({
    this.status = MovieStatus.initial,
    this.movie = const Movie(id: 2)
  });

  final MovieStatus status;
  final Movie movie;

  MovieState copyWith({
    MovieStatus? status,
    Movie? movie
  }) {
    return MovieState(
        status: status ?? this.status,
        movie: movie ?? this.movie,
    );
  }

  @override
  String toString() {
    return '''MovieState { status: $status, movie: ${movie.title} }''';
  }

  @override
  List<Object> get props => [status, movie];
}
