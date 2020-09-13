import 'dart:convert';

WordOfCity wordOfCityFromJson(String str) => WordOfCity.fromJson(json.decode(str));

String wordOfCityToJson(WordOfCity data) => json.encode(data.toJson());

class WordOfCity {
  WordOfCity({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  String title;
  String locationType;
  int woeid;
  String lattLong;

  factory WordOfCity.fromJson(Map<String, dynamic> json) => WordOfCity(
    title: json["title"],
    locationType: json["location_type"],
    woeid: json["woeid"],
    lattLong: json["latt_long"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "location_type": locationType,
    "woeid": woeid,
    "latt_long": lattLong,
  };
}
