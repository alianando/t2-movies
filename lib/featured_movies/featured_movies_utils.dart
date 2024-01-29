import 'package:flutter/cupertino.dart';

import '../models/yts.dart';

class FeaturedMoviesUtils {}

List<Movies> getMoviesByPears(List<Movies> allMovies) {
  List<Movies> movies = allMovies;
  movies.removeWhere((element) {
    return element.torrents == null || !doesContainHDTorrent(element.torrents!);
  });
  for (var element in movies) {
    element.torrents?.removeWhere((element) => element.quality != '1080p');
  }
  movies.sort((a, b) => b.torrents![0].peers!.compareTo(a.torrents![0].peers!));
  const int targetMoviesNumber = 6;
  List<Movies> targetMovies = [];
  for (int i = 0; i < targetMoviesNumber; i++) {
    targetMovies.add(
      allMovies.firstWhere((element) => element.id == movies[i].id),
    );
  }
  return targetMovies;
}

bool doesContainHDTorrent(List<Torrents> torrents) {
  bool contains = torrents.any((element) => element.quality == '1080p');
  return contains;
}
