import 'package:cinemapedia/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

// TODO: todas las pantallas relacionadas a los movies se configura en esta pestaña

class HomeScren extends StatelessWidget {
  static const name = 'Home-screen';
  const HomeScren({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();
    ref.read(popularesMoviesProvider.notifier).loadNextPage();
    ref.read(upCommingPorvider.notifier).loadNextPage();
    ref.read(topRatedProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(firstLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final slideShow = ref.watch(moviesSlideShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayinMoviesProvider);
    final popularMovier = ref.watch(popularesMoviesProvider);
    final upComming = ref.watch(upCommingPorvider);
    final topRated = ref.watch(topRatedProvider);

    return CustomScrollView(
      slivers: [
        //es una funcion que nos sirve para crear los slivers
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
            titlePadding: EdgeInsets.only(left: 10, bottom: 5),
            centerTitle: false,
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  // const CustomAppBar(),
                  MoviesSlideShow(movies: slideShow),
                  MovieHorizontalListView(
                    movies: nowPlayingMovies,
                    title: 'En Cines',
                    subTitle: 'Lunes 20',
                    loadNextPage: () => ref
                        .read(nowPlayinMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalListView(
                    movies: upComming,
                    title: 'Proximamente',
                    subTitle: 'En este mes',
                    loadNextPage: () =>
                        ref.read(upCommingPorvider.notifier).loadNextPage(),
                  ),
                  MovieHorizontalListView(
                    movies: popularMovier,
                    title: 'Populares',
                    // subTitle: 'En este mes',
                    loadNextPage: () => ref
                        .read(popularesMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalListView(
                    movies: topRated,
                    title: 'Mejor Calificadas',
                    // subTitle: 'Siempre',
                    loadNextPage: () =>
                        ref.read(topRatedProvider.notifier).loadNextPage(),
                  ),

                  const SizedBox(height: 10),
                ],
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
