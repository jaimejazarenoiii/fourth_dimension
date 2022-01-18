// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'results': instance.results,
      'page': instance.page,
    };
