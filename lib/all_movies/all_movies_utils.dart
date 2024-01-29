import 'package:t2/models/yts.dart';

import 'all_movies_provider.dart';

class AllMoviesUtils {
  static List<MovieAndDate> add_a_movie_by_date(
    List<MovieAndDate> list,
    Movies newMovie,
    String date,
  ) {
    List<MovieAndDate> _movies_by_date = list;
    if (_movies_by_date.isEmpty) {
      final MovieAndDate md = MovieAndDate(date, [newMovie]);
      _movies_by_date.add(md);
      return _movies_by_date;
    }
    bool noObjectWithGivenDate = true;
    for (int j = 0; j < _movies_by_date.length; j++) {
      if (_movies_by_date[j].dateUploaded == date) {
        noObjectWithGivenDate = false;
      }
    }
    if (noObjectWithGivenDate) {
      final MovieAndDate md = MovieAndDate(date, [newMovie]);
      _movies_by_date.add(md);
      return _movies_by_date;
    }
    int targetObjectIndex = _movies_by_date.indexWhere(
      (md) => md.dateUploaded == date,
    );
    // bool movieExists = false;
    List<Movies> existingMovies = _movies_by_date[targetObjectIndex].movies;
    for (int k = 0; k < existingMovies.length; k++) {
      if (existingMovies[k].id == newMovie.id) {
        // movieExists == true;
        int movieIndex = existingMovies.indexWhere((m) => m.id == newMovie.id);
        _movies_by_date[targetObjectIndex].movies[movieIndex] = newMovie;
        return _movies_by_date;
      }
    }
    // if (movieExists) {
    //   int movieIndex = existingMovies.indexWhere((m) => m.id == newMovie.id);
    //   _movies_by_date[targetObjectIndex].movies[movieIndex] = newMovie;
    //   return _movies_by_date;
    // }
    _movies_by_date[targetObjectIndex].movies.add(newMovie);
    return _movies_by_date;
  }
}
