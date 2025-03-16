import 'dart:convert';

List<VideoModel> videoModelFromJson(String str) =>
    List<VideoModel>.from(json.decode(str).map((x) => VideoModel.fromJson(x)));

class VideoModel {
  final String id;
  final String key;
  final String site;
  final String type;
  final bool official;

  VideoModel({
    required this.id,
    required this.key,
    required this.site,
    required this.type,
    required this.official,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    id: json["id"],
    key: json["key"],
    site: json["site"],
    type: json["type"],
    official: json["official"] ?? false,
  );
}
