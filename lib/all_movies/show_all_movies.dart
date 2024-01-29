import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2/all_movies/all_movies_api_call.dart';
import 'package:t2/all_movies/all_movies_provider.dart';
import 'package:t2/all_movies/show_date.dart';
import 'package:t2/models/yts.dart';

import '../fetch_more_movies/fetch_more_movie_provider.dart';
import '../last_update/last_update_provider.dart';
import '../widgets/1_widget_movie_item_small.dart';

class ShowAllMovies extends StatefulWidget {
  const ShowAllMovies({super.key});

  @override
  State<ShowAllMovies> createState() => _ShowAllMoviesState();
}

class _ShowAllMoviesState extends State<ShowAllMovies> {
  // late ScrollController sc;
  @override
  void initState() {
    super.initState();
    // sc = ScrollController();
    // sc.addListener(listen_to_scrollController);
    fetchData();
  }

  // @override
  // void dispose() {
  //   sc.removeListener(listen_to_scrollController);
  //   sc.dispose();
  // }

  Future<void> fetchData() async {
    final last_update_p = Provider.of<LastUpdateProvider>(
      context,
      listen: false,
    );
    final all_movies_p = Provider.of<AllMoviesProvider>(context, listen: false);
    final fmmp = Provider.of<FetchMoreMoviesProvider>(context, listen: false);
    final YtsData yt = await AllMoviesApiCall.fetchAllMovies();
    all_movies_p.add_movies_to_the_list(yt.data!.movies);
    last_update_p.update_last_update_time(DateTime.now());
    fmmp.update_target_page_number(true);
    return;
  }

  void listen_to_scrollController() {
    debugPrint('i am listening');
  }

  @override
  Widget build(BuildContext context) {
    final all_movies_p = Provider.of<AllMoviesProvider>(context, listen: true);
    final List<MovieAndDate> moviesWithDateMap = all_movies_p.movies_by_date;
    if (all_movies_p.movies_by_date.isEmpty) {
      return const Text('no movie');
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      // controller: sc,
      itemCount: moviesWithDateMap.length,
      itemBuilder: (context, index) {
        return MoviesOfSpecificDate(index: index);
      },
    );
  }
}

class MoviesOfSpecificDate extends StatelessWidget {
  final int index;
  const MoviesOfSpecificDate({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final all_movies_p = Provider.of<AllMoviesProvider>(context, listen: true);
    MovieAndDate moviesWithDate = all_movies_p.movies_by_date[index];
    List<Movies> movies = moviesWithDate.movies;
    final String? date = moviesWithDate.dateUploaded;
    return ListView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ShowDate(date!),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 100 / 160,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return WidgetMovieItemSmall(movies[index]);
            },
          ),
        ),
      ],
    );
  }
}
