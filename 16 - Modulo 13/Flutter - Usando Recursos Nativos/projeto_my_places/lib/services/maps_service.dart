import 'package:flutter_dotenv/flutter_dotenv.dart';

class MapsService {
  String get _apiKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '123456';

  String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7C$latitude,$longitude&key=$_apiKey";
  }
}
