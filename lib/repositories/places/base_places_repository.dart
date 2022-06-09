import 'package:flutter_restaurant_app/model/place_autocomplete_model.dart';

abstract class BasePlacesRepository {

  Future<List<PlaceAutocomplete>?> getAutoCompete(String searchInput) async {
    return null;
  }
}
