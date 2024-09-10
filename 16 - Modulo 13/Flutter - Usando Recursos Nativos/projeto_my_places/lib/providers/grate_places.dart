import 'package:flutter/material.dart';
import 'package:projeto_my_places/models/place.dart';

class GratePlaces with ChangeNotifier {
  final List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  int get placesCount {
    return _places.length;
  }

  Place placeByIndex(int index) {
    return _places[index];
  }
}
