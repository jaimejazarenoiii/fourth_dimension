import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fourth_dimension/network/interfaces/base_client_generator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
part 'movie_router.freezed.dart';

@freezed
class MovieRouter extends BaseClientGenerator with _$MovieRouter {

  // ROTA TANIMLAMALARI
  const MovieRouter._() : super();
  const factory MovieRouter.popular() = _Popular; 


  @override
  String get baseURL => "https://api.themoviedb.org/3/movie/";

  @override
  Map<String, dynamic> get header => {"Content-Type": "application/json"};

  @override
  String get path {
    return this.when<String>(
      popular: () => 'popular'
    );
  }

  @override
  String get method {
    return this.maybeWhen<String>(
      orElse: () => 'GET', // AKSİ BELİRTİLMEDİKÇE İSTEKLER GET OLARAK GİDECEK.
    );
  }

  @override
  dynamic get body {
    return this.maybeWhen(
      orElse: () {
        return null; // AKSİ BELİRTİLMEDİKÇE BODY NULL GİDECEK.
      },
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return this.when(
        popular: () {
          final apiKey = dotenv.get('API_KEY', fallback: '');
          return {'api_key': apiKey};
        }
    );
  }
}
