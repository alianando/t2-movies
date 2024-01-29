import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2/all_movies/all_movies_provider.dart';
import 'package:t2/fetch_more_movies/fetch_more_movie_provider.dart';
import 'package:t2/fetch_more_movies/fetch_more_movies_api_call.dart';
import 'package:t2/models/yts.dart';

import '../last_update/last_update_provider.dart';

class FetchMoreMovieButton extends StatelessWidget {
  const FetchMoreMovieButton({super.key});

  @override
  Widget build(BuildContext context) {
    final fmmp = Provider.of<FetchMoreMoviesProvider>(context, listen: true);
    if (fmmp.target_page_number == 0) {
      /// this means we haven't finished fetching the first one.
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: OutlinedButton(
        onPressed: () async {
          if (fmmp.status == 'fetching.....') {
            return; // we are fetching, so disable this button
          }
          fmmp.changeStatus('fetching.....');
          final lup = Provider.of<LastUpdateProvider>(context, listen: false);
          final amp = Provider.of<AllMoviesProvider>(context, listen: false);

          List<Movies> newMovies = await FetchMoreMoviesApiCall.f(
            fmmp.target_page_number,
          );
          amp.add_movies_to_the_list(newMovies);
          lup.update_last_update_time(DateTime.now());
          fmmp.update_target_page_number(false);
          fmmp.changeStatus('Fetch more');
          return;
        },
        child: Text(fmmp.status),
      ),
    );
  }
}
