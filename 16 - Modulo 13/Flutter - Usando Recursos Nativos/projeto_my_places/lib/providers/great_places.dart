import 'dart:io';
import 'package:projeto_my_places/data/db_sqlite.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:projeto_my_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _places = [];

  Future<void> loadDatabase() async {
    final dataList = await DbSqlite.select('places');

    _places.clear();

    _places = dataList
        .map(
          (data) => Place(
            id: data['id'],
            title: data['title'],
            image: File(data['image']),
            location: PlaceLocation(
              latitude: data['loc_lat'],
              longitude: data['loc_lng'],
              address: data['address'],
            ),
          ),
        )
        .toList();

    notifyListeners();
  }

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

    DbSqlite.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location.latitude,
      'loc_lng': newPlace.location.longitude,
      'address': newPlace.location.address,
    });

    notifyListeners();
  }
}
