// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class VideosModel {
  String name;
  String key;
  bool official;
  DateTime publishedAt;
  String id;

  VideosModel({
    required this.name,
    required this.key,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory VideosModel.fromMap(Map<String, dynamic> map){
   return VideosModel(
       name: map['name'],
       key: map['key'],
       official: map['official'],
       publishedAt: map['published_at'],
       id: map['id'],
   );
  }
}
