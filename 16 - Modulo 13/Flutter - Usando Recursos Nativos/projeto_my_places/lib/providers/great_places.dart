import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_my_places/data/db_sqlite.dart';
import 'package:projeto_my_places/services/maps_service.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:projeto_my_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  int get placesCount {
    return _places.length;
  }

  Place placeByIndex(int index) {
    return _places[index];
  }

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

  Future<void> deletePlace(Place place) async {
    final index = _places.indexWhere((p) => p.id == place.id);

    if (index >= 0) {
      _places.removeAt(index);
      notifyListeners();

      DbSqlite.delete('places', place.id);

      if (place.image.existsSync()) {
        place.image.deleteSync();
      }
    }
  }

  Future<void> addPlace({
    required String title,
    required File image,
    required LatLng position,
  }) async {
    final address = await MapsService().getAddressFrom(position: position);

    final newPlace = Place(
      id: const Uuid().v4(),
      title: title,
      image: image,
      location: PlaceLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
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
