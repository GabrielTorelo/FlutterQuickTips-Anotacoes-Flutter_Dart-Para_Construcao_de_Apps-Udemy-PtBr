import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_my_places/services/api_service.dart';

class MapsService {
  final ApiService _apiService = ApiService();
  String get _apiKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '123456';

  String generateLocationPreviewImage({required LatLng position}) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=${position.latitude},${position.longitude}&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7C${position.latitude},${position.longitude}&key=$_apiKey";
  }

  Future<String> getAddressFrom({required LatLng position}) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$_apiKey';

    final Map<String, dynamic> response =
        await _apiService.methodGET(path: url);

    if (response.containsKey('error')) return Future.error(response['error']);

    return response['results'][0]['formatted_address'];
  }
}
