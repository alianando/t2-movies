import 'package:flutter/material.dart';
import 'package:t2/models/yts.dart';
import 'package:t2/pages/yts/movie_details/show_trailer.dart';

class YtsMovieDetails extends StatelessWidget {
  final Movies? movie;
  const YtsMovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            const AppBar(),
            ShowMovieTrailer(movie!.ytTrailerCode!),
            // ShowImage(
            //   url: movie!.mediumCoverImage!,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie!.title!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${movie!.rating!} / 10'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(movie!.descriptionFull!),
            ),
            Text('Genres: ${movie!.genres!.join(', ')}'),
            Text('Language: ${movie!.language}'),
            Text('Year: ${movie!.year}'),
            Text('Runtime: ${movie!.runtime}'),
            Text('MAP Rating: ${movie!.mpaRating}'),
            Text('Torrents: ${movie!.torrents!.length}'),
            Text('Torrents: ${movie!.torrents![0].url}'),
            Text('Torrents: ${movie!.torrents![0].quality}'),
            Text('Torrents: ${movie!.torrents![0].type}'),
            Text('Torrents: ${movie!.torrents![0].size}'),
            Text('Torrents: ${movie!.torrents![0].seeds}'),
            Text('Torrents: ${movie!.torrents![0].peers}'),
            Text('Torrents: ${movie!.torrents![0].sizeBytes}'),
            Text('Torrents: ${movie!.torrents![0].dateUploaded}'),
            Text(
              'Torrents: ${movie!.torrents![0].dateUploadedUnix.toString()}',
            ),
            Text('Torrents: ${movie!.torrents![0].dateUploadedUnix}'),
            Text('Torrents: ${movie!.torrents![0].hash}'),
            Text('Summary: ${movie!.summary}'),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.all(8.0), child: Text('AppBar'));
  }
}
