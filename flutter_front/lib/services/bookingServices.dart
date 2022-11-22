import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/booking.dart';
import 'package:http/http.dart' as http;

class BookingServices extends ChangeNotifier {

  Booking _bookingData = new Booking(username: "",name:"",id: "");

  Booking get bookingData => _bookingData;

  void setBookingData(Booking bookingData) {
    _bookingData = bookingData;
  }
  Future<List<Booking>?> getBookings() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/bookings');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return bookingFromJson(json);
    }
    return null;
  }

  /* Future<void> deleteUsers(String name) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/users/delete/$name');
    await client.delete(uri);
  }

  Future<void> createUser(User user) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/users/register');
    var userJS = json.encode(user.toJson());
    await client.post(uri,
        headers: {'content-type': 'application/json'}, body: userJS);
  }

  Future<bool> updateUser(User user) async {
    var client = http.Client();
    var name = user.name;
    var uri = Uri.parse('http://localhost:5432/api/users//update/$name');
    var userJS = json.encode(user.toJson());
    var response = await client.put(uri,
        headers: {'content-type': 'application/json'}, body: userJS);
    if (response.statusCode == 200) {
      var json = response.body;
      return true;
    } else {
      return false;
    }
  } */
}
