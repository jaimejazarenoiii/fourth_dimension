import 'package:equatable/equatable.dart';
import '../../network/interfaces/base_api_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'movie.dart';
part 'movies.g.dart';

@JsonSerializable()
class Movies extends Equatable with BaseApiResponseModel<Movies> {
  const Movies({required this.results, required this.page});

  final List<Movie> results;
  final int page;

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesToJson(this);

  @override
  Movies fromJson(Map<String, dynamic> json) {
    return Movies.fromJson(json);
  }

  @override
  List<Object> get props => [results, page];
}
