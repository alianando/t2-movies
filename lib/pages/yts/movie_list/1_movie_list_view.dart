// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../models/yts.dart';
import '../../../widgets/1_widget_movie_item_small.dart';

class MoviesListView extends StatefulWidget {
  final List<Movies>? movies;
  const MoviesListView({super.key, required this.movies});

  @override
  State<MoviesListView> createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView> {
  @override
  void initState() {
    super.initState();
    widget.movies?.sort((a, b) => b.rating!.compareTo(a.rating!));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // crossAxisSpacing: 10,
          // mainAxisSpacing: 10,
          // childAspectRatio: 100 / 144,
          childAspectRatio: 100 / 160,
          // mainAxisExtent: 164,
        ),
        itemCount: widget.movies?.length,
        itemBuilder: (context, index) {
          return WidgetMovieItemSmall(widget.movies![index]);
        },
      ),
    );
  }
}
