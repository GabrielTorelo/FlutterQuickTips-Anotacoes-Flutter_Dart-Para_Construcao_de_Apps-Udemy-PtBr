import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:projeto_my_places/models/coordinate.dart';
import 'package:projeto_my_places/screens/map_screen.dart';
import 'package:projeto_my_places/services/maps_service.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  final MapsService _mapsService = MapsService();
  String? _previewImageUrl;
  LocationData? _location;

  Future<void> _getLocation() async {
    final LocationData locationData = await Location().getLocation();

    setState(() {
      _location = locationData;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    _location ?? await _getLocation();

    final String staticMapImageUrl = _mapsService.generateLocationPreviewImage(
      latitude: _location!.latitude!,
      longitude: _location!.longitude!,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _selectOnMap() async {
    _location ?? await _getLocation();

    final Coordinate initialLocation = Coordinate(
      latitude: _location!.latitude!,
      longitude: _location!.longitude!,
    );

    final LatLng? selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => MapScreen(
          isReadOnly: false,
          coordinates: initialLocation,
        ),
      ),
    );

    if (selectedLocation == null) {
      return;
    }

    final String staticMapImageUrl = _mapsService.generateLocationPreviewImage(
      latitude: selectedLocation.latitude,
      longitude: selectedLocation.longitude,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: SizedBox(
              height: isLandscape
                  ? mediaQuery.size.height * 0.5
                  : mediaQuery.size.height * 0.35,
              width: double.infinity,
              child: _previewImageUrl == null
                  ? const Center(
                      child: Text('No location chosen'),
                    )
                  : Image.network(
                      _previewImageUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
              onPressed: _getCurrentUserLocation,
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
              onPressed: _selectOnMap,
            ),
          ],
        ),
      ],
    );
  }
}
