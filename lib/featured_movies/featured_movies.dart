import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2/featured_movies/featured_movies_utils.dart';
import 'package:t2/models/yts.dart';

import '../all_movies/all_movies_provider.dart';
import '../widgets/1_widget_movie_item_small.dart';

class FeaturedMovies extends StatelessWidget {
  const FeaturedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final amp = Provider.of<AllMoviesProvider>(context, listen: true);
    List<Movies> allMovies = amp.movies;
    if (allMovies.isEmpty) {
      return Container();
    }
    // allMovies.sort((a, b) => b.torrents!.length.compareTo(a.torrents!.length));
    allMovies = getMoviesByPears(allMovies);
    return ListView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('Popular movies'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 100 / 160,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return WidgetMovieItemSmall(allMovies[index]);
            },
          ),
        ),
      ],
    );

    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     const Text('Most Popular Movies'),
    //     SizedBox(
    //       height: 200,
    //       child: ListView.builder(
    //         shrinkWrap: true,
    //         scrollDirection: Axis.horizontal,
    //         physics: const ScrollPhysics(),
    //         itemCount: 5,
    //         itemBuilder: (_, index) {
    //           debugPrint('$index ${allMovies[index].torrents![0].peers!}');
    //           return WidgetMovieItemSmall(allMovies[index]);
    //         },
    //       ),
    //     ),
    //   ],
    // );
  }
}
