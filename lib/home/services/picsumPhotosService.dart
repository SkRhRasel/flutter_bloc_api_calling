// To parse this JSON data, do
//
//     final picsumPhotos = picsumPhotosFromJson(jsonString);

import 'dart:convert';

PicsumPhotos picsumPhotosFromJson(String str) => PicsumPhotos.fromJson(json.decode(str));

String picsumPhotosToJson(PicsumPhotos data) => json.encode(data.toJson());

class PicsumPhotos {
  PicsumPhotos({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  factory PicsumPhotos.fromJson(Map<String, dynamic> json) => PicsumPhotos(
    id: json["id"],
    author: json["author"],
    width: json["width"],
    height: json["height"],
    url: json["url"],
    downloadUrl: json["download_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author": author,
    "width": width,
    "height": height,
    "url": url,
    "download_url": downloadUrl,
  };
}
