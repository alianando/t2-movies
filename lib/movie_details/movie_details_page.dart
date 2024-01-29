import 'package:flutter/material.dart';

import '../models/yts.dart';
import 'package:dio/dio.dart';
import 'package:open_file_plus/open_file_plus.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movies? movie;
  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                movie!.largeCoverImage!,
                fit: BoxFit.scaleDown,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MovieProperties(
                    value: movie!.rating.toString(), type: 'Rating'),
                MovieProperties(value: movie!.language, type: 'Language'),
                if (movie!.mpaRating != null && movie!.mpaRating != '')
                  MovieProperties(value: movie!.mpaRating, type: 'MAP'),
              ],
            ),
            const Divider(color: Colors.white12),
            MovieGenres(movie!.genres!),
            const Divider(color: Colors.white12),
            DownloadSection(
                name: movie!.title!, torrents: movie?.torrents ?? []),
            const Divider(color: Colors.white12),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Synopsys'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(movie!.synopsis!),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieProperties extends StatelessWidget {
  const MovieProperties({
    super.key,
    required this.value,
    required this.type,
  });

  final String? value;
  final String type;

  @override
  Widget build(BuildContext context) {
    // if (value == null || value == '') {
    //   return const SizedBox.shrink();
    // }
    return Column(
      children: [
        Text(
          value!,
          style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
        ),
        Text(type, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

class MovieGenres extends StatelessWidget {
  final List<String>? genres;
  const MovieGenres(this.genres, {super.key});

  @override
  Widget build(BuildContext context) {
    if (genres == null || genres!.isEmpty) {
      return const Text('No Genres found');
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: genres!.length + 1,
          itemBuilder: (_, index) {
            if (index == 0) {
              return const Center(child: Text('Genres '));
            }
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.red, width: .5 // red as border color
                      ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Center(child: Text(genres![index - 1])),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DownloadSection extends StatelessWidget {
  final String name;
  final List<Torrents> torrents;
  const DownloadSection({
    super.key,
    required this.name,
    required this.torrents,
  });

  void _downloadFile(String title, String url) async {
    const String path = "/storage/emulated/0/Download/";
    String newTitle = title.replaceAll(' ', '');
    Dio dio = Dio();
    var response = await dio.download(url, "$path$newTitle.torrent");
    if (response.statusCode == 200) {
      OpenFile.open("$path$newTitle.torrent");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (torrents.isEmpty) {
      return const Text('No Torrents');
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Torrents'),
          ),
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: torrents.length,
            itemBuilder: (_, index) {
              return Card(
                child: InkWell(
                  onTap: () {
                    debugPrint('hello');
                    _downloadFile(name, torrents[index].url!);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(torrents[index].quality!),
                        Text(torrents[index].size!),
                        // Text(torrents[index].audioChannels!),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
    // final Torrents t1 = torrents.first;
    // final String quality = t1.quality!;
    // final String size = t1.size!;
    // return Text(size);
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.all(8.0), child: Text('AppBar'));
  }
}
