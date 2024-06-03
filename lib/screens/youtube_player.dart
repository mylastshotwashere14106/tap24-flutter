import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:youtube_player_flutter/youtube_player_flutter.dart";

import "../network/api_videos.dart";

class YoutubePlayerScreen extends StatefulWidget{
  const YoutubePlayerScreen({Key? key}): super(key: key);

  @override
  State<YoutubePlayerScreen> createState() => _YouTubePlayerState();
}

class _YouTubePlayerState extends State<YoutubePlayerScreen>{

  ApiVideos? apiVideos;
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    apiVideos = ApiVideos(movieid: '653346');
    _controller = YoutubePlayerController(
      initialVideoId: 'yfQ1fTKkYgs',
      flags: YoutubePlayerFlags(autoPlay: true, mute: false, startAt: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        showVideoProgressIndicator: true,
        controller: _controller!,
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Youtube Player Flutter',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: player,
      ),
    );
  }



}