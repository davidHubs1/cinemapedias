// unica mision leer diferentes modelos y crear mi entidad
// es que nosotros podamos crear un video basado de lo que venga

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovideMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: (moviedb.backdropPath != '')
            ? 'http://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : 'https://i.pinimg.com/564x/99/02/a6/9902a624c47fb2576fc48e4d229f479b.jpg',
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: (moviedb.posterPath != '')
            ? 'http://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : 'no -poster',
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
      );
  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: (moviedb.backdropPath != '')
            ? 'http://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : 'https://i.pinimg.com/564x/99/02/a6/9902a624c47fb2576fc48e4d229f479b.jpg',
        genreIds: moviedb.genres.map((e) => e.name).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: (moviedb.posterPath != '')
            ? 'http://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : 'https://i.pinimg.com/564x/99/02/a6/9902a624c47fb2576fc48e4d229f479b.jpg',
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
      );
}
