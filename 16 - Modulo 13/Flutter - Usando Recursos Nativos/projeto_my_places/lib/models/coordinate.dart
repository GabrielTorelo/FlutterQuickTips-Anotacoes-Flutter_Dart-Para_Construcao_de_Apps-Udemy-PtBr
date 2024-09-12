import 'package:google_maps_flutter/google_maps_flutter.dart';

class Coordinate {
  final double longitude;
  final double latitude;

  Coordinate({
    required this.longitude,
    required this.latitude,
  });

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }

  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }

  Map<String, dynamic> toJson() {
    return {
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}
