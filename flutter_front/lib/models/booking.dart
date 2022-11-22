// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_front/models/user.dart';

List<Booking> bookingFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  Booking({
    //this.id = "", // non nullable but optional with a default value
    required this.username,
    required this.name,
    required this.id,
  });
  String username;
  String id;
  String name;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["_id"],
        name: json["name"],
        username: json["user.name"],
        
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "username": username,
      };
}
