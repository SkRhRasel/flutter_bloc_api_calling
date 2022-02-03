// To parse this JSON data, do
//
//     final picsumPhoto = picsumPhotoFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart';

PicsumPhotosActivity picsumPhotosActivityFromJson(String str) => PicsumPhotosActivity.fromJson(json.decode(str));

String picsumPhotosActivityToJson(PicsumPhotosActivity data) => json.encode(data.toJson());

class PicsumPhotosActivity {
  PicsumPhotosActivity({
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

  factory PicsumPhotosActivity.fromJson(Map<String, dynamic> json) => PicsumPhotosActivity(
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


class PicsumPhotosService{

  Future<void> getData() async {
    picsumPhotosList = <PicsumPhotosActivity>[];
    getPicsumPhotosActivity();
    //getCategoryList(false);
  }


  bool isDataLoaded = false;

  List<PicsumPhotosActivity> picsumPhotosList = <PicsumPhotosActivity>[];

  Future<PicsumPhotosActivity> getPicsumPhotosActivity() async {
    final response = await get(Uri.parse('https://picsum.photos/v2/list'));

    if (response.body.isNotEmpty) {
      var map = json.decode(response.body);
      List<PicsumPhotosActivity> list = List<PicsumPhotosActivity>.from(map.map((x) => PicsumPhotosActivity.fromJson(x)));
      picsumPhotosList.addAll(list);
    }
    return picsumPhotosList.first;
  }

  // Future<PicsumPhotosActivity> getPicsumPhotosActivity() async {
  //   final response = await get(Uri.parse('https://picsum.photos/v2/list'));
  //
  //   var map = json.decode(response.body);
  //   var list = List<PicsumPhotosActivity>.from(map.map((x) => PicsumPhotosActivity.fromJson(x)));
  //   picsumPhotosList.addAll(list);
  //   return picsumPhotosList.first;
  // }


}
