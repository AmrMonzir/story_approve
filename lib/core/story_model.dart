// To parse this JSON data, do
//
//     final storyModel = storyModelFromJson(jsonString);

import 'dart:convert';

StoryModel storyModelFromJson(String str) =>
    StoryModel.fromJson(json.decode(str));

String storyModelToJson(StoryModel data) => json.encode(data.toJson());

class StoryModel {
  int id;
  String title;
  String author;
  String location;
  int? yearOfBirth;
  String picture;
  String shortBio;
  String longBio;
  String name;
  bool approved;

  StoryModel({
    required this.id,
    required this.title,
    required this.author,
    required this.location,
    this.yearOfBirth,
    required this.picture,
    required this.shortBio,
    required this.longBio,
    required this.approved,
    required this.name,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        location: json["location"],
        yearOfBirth: json["year_of_birth"],
        picture: json["picture"],
        shortBio: json["short_bio"],
        longBio: json["long_bio"],
        approved: json["approved"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "location": location,
        "year_of_birth": yearOfBirth,
        "picture": picture,
        "short_bio": shortBio,
        "long_bio": longBio,
        "approved": approved,
        "name": name,
      };
}
