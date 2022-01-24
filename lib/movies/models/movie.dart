import 'package:equatable/equatable.dart';
import '../../network/interfaces/base_api_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie extends Equatable with BaseApiResponseModel<Movie> {
  const Movie({required this.id, this.title, this.posterPath, this.overview, this.releaseDate, this.originalTitle});

  final int id;
  final String? title;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final String? overview;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'original_title')
  final String? originalTitle;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  Movie fromJson(Map<String, dynamic> json) {
    return Movie.fromJson(json);
  }

  @override
  List<Object> get props => [id];
}
