import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tap2024/models/popular_model.dart';

class ApiVideos {

  String movieid = "";

  ApiVideos({
    required this.movieid,
  });

  Future<List<VideosModel>?> getAllPopular() async {
    Uri uri = Uri.parse('https://api.themoviedb.org/3/movie/${movieid}/videos?api_key=37f7e51498f67efce9ac39ffc0af3040');
    Response response = await http.get(uri);
    if( response.statusCode == 200 ){
      final jsonPopular = jsonDecode(response.body)['results'] as List;
      return jsonPopular.map((popular) => VideosModel.fromMap(popular)).toList();
    }
    return null;
  }

}