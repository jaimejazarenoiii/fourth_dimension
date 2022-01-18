// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as int,
      title: json['title'] as String?,
      posterPath: json['posterPath'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['releaseDate'] as String?,
      originalTitle: json['originalTitle'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'posterPath': instance.posterPath,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate,
      'originalTitle': instance.originalTitle,
    };
