import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import '../movies.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';
import 'package:fourth_dimension/repositories/movie_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc({required this.repository}) : super(const MoviesState()) {
    on<MoviesFetched>(
      _onMoviesFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<MoviesClicked>((event, emit) {},
      transformer: throttleDroppable(throttleDuration)
    );
    on<AddMovie>(
      _addMovie,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final MovieRepository repository;

  Future<void> _onMoviesFetched(
    MoviesFetched event,
    Emitter<MoviesState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      final tmpMovies = await repository.fetchAllMovies();
      if (state.status == MoviesStatus.initial) {
        return emit(state.copyWith(
          status: MoviesStatus.success,
          movies: tmpMovies,
          hasReachedMax: false,
        ));
      }
      final movies = [];
      movies.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: MoviesStatus.success,
                movies: List.of(state.movies),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: MoviesStatus.failure));
    }
  }

  Future<void> _addMovie(
      AddMovie event,
      Emitter<MoviesState> emit,
  ) async {
    try {
      final maxId = await state.movies.map((movie) => movie.id).reduce(max);
      final movie = Movie(id: maxId.toInt() + 1, title: 'ggg', body: 'lez go gogo');
      emit(
          state.copyWith(
              status: MoviesStatus.success,
              movies: List.of(state.movies)..add(movie),
              hasReachedMax: false
          )
      );
    } catch (_) {
      emit(state.copyWith(status: MoviesStatus.failure));
    }
  }
}
