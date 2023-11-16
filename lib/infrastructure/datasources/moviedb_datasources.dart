// para trabajar las interacciones
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

//configuracion de peticciones http que nunca va cambiar
// es propio para el data source MOVIEDBw

class MoviedDataSource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMoviDbKey,
        'language': 'es-Pe'
      }));

  //creando el metodo para reutilizar el codigo
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MoveDbResponse.fromJson(json);

    //y se regresea un listado de movies
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) =>
            moviedb.posterPath !=
            'no-poster') // si no tiene el poster  == no quiero que me muestr
        .map(
          (moviedb) => MovideMapper.movieDBToEntity(moviedb),
        )
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing',
        queryParameters: {'page': page}); // esta es una solicitud de mi entidad
    //recibimos nuestro json
    //lo mapeamos
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpComming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }
    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovideMapper.movieDetailsToEntity(movieDetails);
// 
    return movie;
  }
}
