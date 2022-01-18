import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import '../movie.dart';
import '../../movies.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'movie_event.dart';
part 'movie_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({required this.httpClient, required this.movie}) : super(const MovieState()) {
    on<MovieFetched>(
      _onMovieFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<MovieClicked>((event, emit) {
      },
      transformer: throttleDroppable(throttleDuration)
    );
  }

  final http.Client httpClient;
  final Movie movie;

  Future<void> _onMovieFetched(
    MovieFetched event,
    Emitter<MovieState> emit,
  ) async {
    try {
      if (state.status == MovieStatus.initial) {
        return emit(state.copyWith(
          status: MovieStatus.success,
          movie: null
        ));
      }
      final Movie? movie = null;
      movie == null
          ? emit(state.copyWith(status: MovieStatus.failure))
          : emit(
              state.copyWith(
                status: MovieStatus.success,
                movie: state.movie
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }
}
