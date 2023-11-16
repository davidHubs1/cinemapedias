import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentations/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// se encarga de traer las 6 primeras peliculas del slider

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayinMoviesProvider);

  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0, 6);
});
