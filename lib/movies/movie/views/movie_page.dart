import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_dimension/movies/movie/movie.dart';
import 'package:fourth_dimension/movies/movies.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieBloc(httpClient: http.Client(), movie:
          this.movie)..add(MovieFetched()),
      child: Scaffold(
          appBar: AppBar(
              title: Text('${this.movie.title}')
          ),
          body: new Container(child: _mainWidget(context))
      )
    );
  }

  Widget _mainWidget(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.android:
        return Text('Android phone');
            // return widget on Android.
      case TargetPlatform.iOS:
        // return widget on iOS.
        // This is used in the platform side to register the view.
        const String viewType = 'SampleViewController';
        // Pass parameters to the platform side.
        final Map<String, dynamic> creationParams = <String, dynamic>{};
        return UiKitView(
                viewType: viewType,
                layoutDirection: TextDirection.ltr,
                creationParams: creationParams,
                creationParamsCodec: const StandardMessageCodec(),
            );
      default: throw UnsupportedError('Unsupported platform view');
    }
  }
}

