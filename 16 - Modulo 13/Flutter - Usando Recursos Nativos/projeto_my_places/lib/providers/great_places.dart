import 'dart:io';
import 'package:uuid/uuid.dart';
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

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: const Uuid().v4(),
      title: title,
      image: image,
      location: const PlaceLocation(
        latitude: 0,
        longitude: 0,
        address: '',
      ),
    );

    _places.add(newPlace);
    notifyListeners();
  }
}
