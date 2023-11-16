// que permite la reutilizacion

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentations/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// notifica cuando el estado cambie
final nowPlayinMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

//populares
final popularesMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

// upcomming
final upCommingPorvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpComming;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});
// top Rated
final topRatedProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

// -----------------------------------------------------//
//typedef el tipo de funcion que espero
typedef MovieCallback = Future<List<Movie>> Function(
    {int page}); // define el caso de uso

// que tipo de estado mantiene StateNotifies
class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  //que proporcione el listado de MOvies
  MoviesNotifier({required this.fetchMoreMovies}) : super([]);
  //

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    // objetivo modifica al state: y el state es un listado de Movie
    currentPage++;

    //crear un nuevo state
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
    // final List<Movie> movies =
  }
}
