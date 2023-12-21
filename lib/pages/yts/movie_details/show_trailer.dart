import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShowMovieTrailer extends StatefulWidget {
  final String ytTrailerCode;
  const ShowMovieTrailer(this.ytTrailerCode, {super.key});

  @override
  State<ShowMovieTrailer> createState() => _ShowMovieTrailerState();
}

class _ShowMovieTrailerState extends State<ShowMovieTrailer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      // initialVideoId: 'iLnmTe5Q2Qw',
      initialVideoId: widget.ytTrailerCode,
      flags: const YoutubePlayerFlags(
        hideControls: false,
        // autoPlay: true,
        autoPlay: false,
        // mute: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.pause();
    // _controller.removeListener(() {});
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      width: double.infinity,
      controller: _controller,
      showVideoProgressIndicator: true,
      // videoProgressIndicatorColor: Colors.amber,
      // progressColors: ProgressColors(
      //     playedColor: Colors.amber,
      //     handleColor: Colors.amberAccent,
      // ),
      // onReady () {
      //     _controller.addListener(listener);
      // },
    );
  }
}
