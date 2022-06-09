import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/repositories/repositories.dart';
import 'package:http/http.dart' as http;
import '../../model/place_autocomplete_model.dart';

class PlacesRepository extends BasePlacesRepository {
  final String key = 'AIzaSyDEf_peK3ebAU1otcma9JU1VB-qW1yoY4Q';
  final String webKey = 'AIzaSyC1dwIXxDtrC20um_5zN5DXahnf6kl4g64';
  final String types = 'geocode';

  @override
  Future<List<PlaceAutocomplete>> getAutoCompete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$webKey';

    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);


    var results = json['predictions'] as List;

    var status = json['status'];
    var errorMessage = json['error_message'];

    debugPrint('Status: $status');
    debugPrint('Error: $errorMessage');

    return results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  }
}
