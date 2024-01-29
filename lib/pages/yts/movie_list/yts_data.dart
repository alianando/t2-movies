import 'package:flutter/material.dart';

import '../../../api_services.dart/yts_api.dart';
import '../../../models/yts.dart';
import '1_movie_list_view.dart';

class ShowYts extends StatelessWidget {
  const ShowYts({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<YtsData>(
      future: YtsApi.getMovies(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error ${snapshot.error}'));
        }
        if (snapshot.hasData) {
          List<Movies>? movies = snapshot.data!.data!.movies;
          return MoviesListView(movies: movies);
        }
        return const Text('no data');
      },
    );
  }
}
