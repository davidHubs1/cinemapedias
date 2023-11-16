// mantener la cache

import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentations/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorByMovieProvider =
    StateNotifierProvider<ActorByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsRepos = ref.watch(actorsRepositoriProvider);

  return ActorByMovieNotifier(getActors: actorsRepos.getActorsByMovie);
});
/*
  {
    '12312312' : <Actor>[],
    '12312312' : <Actor>[],
    '12312312' : <Actor>[],
    '12312312' : <Actor>[],
  }
 */
typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;
  ActorByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
