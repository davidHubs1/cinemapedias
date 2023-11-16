// provider que no va cambiar nunca  == provider de lectura

// creando la instancia de mi repositorio

//providers de solo lectura
// provider es un proveedor de informacion

import 'package:cinemapedia/infrastructure/datasources/actor_moviddb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable
// su objetivo es proporicionar la informacion necesaria para que puedan consultar la todo lo que se proporciona 

final actorsRepositoriProvider = Provider((ref) {
  return ActorRepositoryIml(ActorMovieDbDataSource());
});
