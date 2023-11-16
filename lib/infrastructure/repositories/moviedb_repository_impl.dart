// eta es una implementacion

//lo que hace es llamar el datasourse y el datasourse llama esos metodos

import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repositori.dart';

class MovieRepositoryImpl extends MovieRepository {
  //llamando el datasource
  final MoviesDataSource dataSource;
  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getUpComming({int page = 1}) {
    return dataSource.getUpComming(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return dataSource.getTopRated(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id);
  }
}

// para qu efacilmente pueda cambiar los origenes de datos pero cuando se use los providers de riverpod
// simplemente se llama esta implementacion MovieRepositoryImpl que ya tiene el data source que tiene el mecanizmo de
// funcionalidad
