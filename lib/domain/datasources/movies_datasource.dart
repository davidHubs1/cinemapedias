import 'package:cinemapedia/domain/entities/movie.dart';
//TODO : esto es los origenes de datos

abstract class MoviesDataSource {
  //como lucen los origenes de datos que traen las peliculas

  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpComming({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});

  Future<Movie> getMovieById(String id);
  


}
