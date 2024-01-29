import 'package:flutter/material.dart';
import 'package:t2/all_movies/all_movies_utils.dart';

import '../models/yts.dart';

class AllMoviesProvider extends ChangeNotifier {
  AllMoviesProvider();
  List<Movies> _movies = [];
  List<Movies> get movies => _movies;
  List<MovieAndDate> movies_by_date = [];

  // add new movies in movies list;
  void add_movies_to_the_list(List<Movies>? newMovies) {
    if (newMovies == null || newMovies.isEmpty) {
      debugPrint('AllMoviesProvider: no new movies found');
      return;
    }
    _movies.addAll(newMovies);
    _movies.retainWhere((m) => m.id != null && m.title != null);
    update_movies_by_date(newMovies);
    notifyListeners();
  }

  void update_movies_by_date(List<Movies> newMovies) {
    /// iterating through newMovies to check for dates
    for (int i = 0; i < newMovies.length; i++) {
      final Movies current_movie = newMovies[i];
      final String? dt_string = current_movie.dateUploaded;
      if (dt_string == null || dt_string.isEmpty) {
        // movies_with_no_dt.add(current_movie);
        movies_by_date = AllMoviesUtils.add_a_movie_by_date(
          movies_by_date,
          current_movie,
          'null',
        );
        continue;
      }
      movies_by_date = AllMoviesUtils.add_a_movie_by_date(
        movies_by_date,
        current_movie,
        dt_string.substring(0, 10),
      );
      movies_by_date.sort((a, b) => b.dateUploaded!.compareTo(a.dateUploaded!));
    }
  }
}

class MovieAndDate {
  // DateTime? dt;
  String? dateUploaded;
  List<Movies> movies;
  MovieAndDate(this.dateUploaded, this.movies);
}
