import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:projeto_my_places/services/maps_service.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    LocationData locationData = await Location().getLocation();

    final String staticMapImageUrl = MapsService().generateLocationPreviewImage(
      latitude: locationData.latitude!,
      longitude: locationData.longitude!,
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
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
