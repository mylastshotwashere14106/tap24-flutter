import 'package:flutter/material.dart';
import 'package:tap2024/models/popular_model.dart';
import 'package:tap2024/network/api_popular.dart';
import 'package:tap2024/screens/youtube_player.dart';
import 'package:tap2024/views/popular_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  
  ApiPopular? apiPopular;

  @override
  void initState() {
    super.initState();
    apiPopular = ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas Populares'),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_library),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => YoutubePlayerScreen(),
                ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: apiPopular!.getAllPopular(),
        builder: (context, AsyncSnapshot<List<VideosModel>?> snapshot) {
          if( snapshot.hasData ){
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10,),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => PopularView(popularModel: snapshot.data![index],),
            );
          }else{
            if( snapshot.hasError ){
              return Text('${snapshot.error}');
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
        },
      ),
    );
  }
}