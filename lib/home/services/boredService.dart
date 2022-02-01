// To parse this JSON data, do
//
//     final boredActivity = boredActivityFromJson(jsonString);

import 'dart:convert';
import 'package:flutter_bloc_api_calling/utils/common_utils.dart';
import 'package:http/http.dart';

BoredActivity boredActivityFromJson(String str) => BoredActivity.fromJson(json.decode(str));

String boredActivityToJson(BoredActivity data) => json.encode(data.toJson());

class BoredActivity {
  BoredActivity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  String activity;
  String type;
  int participants;
  dynamic price;
  String link;
  String key;
  dynamic accessibility;

  factory BoredActivity.fromJson(Map<String, dynamic> json) => BoredActivity(
    activity: json["activity"],
    type: json["type"],
    participants: json["participants"],
    price: makeDouble(json["price"]),
    link: json["link"],
    key: json["key"],
    accessibility: makeDouble(json["accessibility"]),
  );

  Map<String, dynamic> toJson() => {
    "activity": activity,
    "type": type,
    "participants": participants,
    "price": price,
    "link": link,
    "key": key,
    "accessibility": accessibility,
  };
}

class BoredServices{
  Future<BoredActivity> getBoredActivity() async {
    final response = await get(Uri.parse('https://www.boredapi.com/api/activity'));
    final activity = boredActivityFromJson(response.body);
    return activity;
  }
}
