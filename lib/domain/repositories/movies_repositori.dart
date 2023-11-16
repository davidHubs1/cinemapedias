import 'package:cinemapedia/domain/entities/movie.dart';

//TODO : y este repositorio llama al que es el datasource
//permite cambiar el datasource

abstract class MovieRepository {
  //como lucen los origenes de datos que traen las peliculas

  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});

  /// creat upcommin y crear getTopRted
  Future<List<Movie>> getUpComming({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});

  Future<Movie> getMovieById(String id);
}
