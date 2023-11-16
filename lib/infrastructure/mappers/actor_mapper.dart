import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? 'http://image.tmdb.org/t/p/w500${cast.profilePath}'
            : 'https://i.pinimg.com/564x/33/24/0e/33240ee3c315c0fe6768c9208bb03429.jpg',
        character: cast.character,
      );
}
