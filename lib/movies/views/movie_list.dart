import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_dimension/movies/movies.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          switch (state.status) {
            case MoviesStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case MoviesStatus.success:
              if (state.movies.isEmpty) {
                return const Center(child: Text('no posts'));
              }
              return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.movies.length
                        ? BottomLoader()
                        : MovieListItem(movie: state.movies[index]);
                  },
                  itemCount: state.hasReachedMax
                  ? state.movies.length
                  : state.movies.length + 1,
                  controller: _scrollController,
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<MoviesBloc>().add(MoviesFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
