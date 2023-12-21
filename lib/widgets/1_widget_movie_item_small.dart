// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:t2/models/yts.dart';

import '../api_services.dart/yts_api.dart';
import '../pages/yts/movie_details/movie_details.dart';

class WidgetMovieItemSmall extends StatelessWidget {
  final Movies movie;
  const WidgetMovieItemSmall(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return YtsMovieDetails(
            movie: movie,
          );
        }));
      },
      child: Card(
        child: Stack(children: [
          ShowImage(
            url: movie.largeCoverImage!,
          ),
          Positioned(
            bottom: 0.5,
            left: 5,
            right: 0,
            child: Text('${movie.rating!} / 10'),
          ),
        ]),
      ),
    );
  }
}

class ShowImage extends StatefulWidget {
  final String url;
  const ShowImage({super.key, required this.url});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  bool imgOkay = false;

  void imgCheck() async {
    bool result = await YtsApi.checkImage(widget.url);
    setState(() {
      imgOkay = result;
    });
  }

  @override
  void initState() {
    super.initState();
    imgCheck();
  }

  @override
  Widget build(BuildContext context) {
    if (imgOkay) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          widget.url,
          fit: BoxFit.cover,
          // width: MediaQuery.of(context).size.width * 0.30,
        ),
      );
    }
    return const Center(child: Text('no image'));
  }
}
