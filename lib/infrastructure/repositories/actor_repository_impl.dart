import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryIml extends ActorsRepository {
  final ActorsDataSource dataSource;

  ActorRepositoryIml(this.dataSource);
  @override
  Future<List<Actor>> getActorsByMovie(String movieById) {
    return dataSource.getActorsByMovie(movieById);
  }
}
