import 'package:flutter/material.dart';
import 'package:t2/all_movies/show_all_movies.dart';
import 'package:t2/last_update/last_update.dart';
import 'package:t2/pages/yts/movie_list/yts_data.dart';

import '../../featured_movies/featured_movies.dart';
import '../../fetch_more_movies/fetch_more_movie_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('t2'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, '/search');
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: const [
          LastUpdate(),
          FeaturedMovies(),

          // MoviesOfSpecificDate(index: 0),
          ShowAllMovies(),
          FetchMoreMovieButton(),
          // _SavedMoviesButton(),
          // ShowYts(),
        ],
      ),
    );
  }
}

class _SavedMoviesButton extends StatelessWidget {
  const _SavedMoviesButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, '/saved');
          debugPrint('Saved Movies');
        },
        child: Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          child: const Center(child: Text('Saved Movies')),
        ),
      ),
    );
  }
}
