import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:projeto_my_places/components/alert_error.dart';
import 'package:projeto_my_places/models/coordinate.dart';
import 'package:projeto_my_places/screens/map_screen.dart';
import 'package:projeto_my_places/services/maps_service.dart';

class LocationFormField extends StatefulWidget {
  final Function(LatLng pickedImage) onPositionSelected;
  final bool isValid;

  const LocationFormField({
    super.key,
    required this.onPositionSelected,
    required this.isValid,
  });

  @override
  State<LocationFormField> createState() => _LocationFormFieldState();
}

class _LocationFormFieldState extends State<LocationFormField> {
  bool _isValid = true;
  final MapsService _mapsService = MapsService();
  String? _previewImageUrl;
  LocationData? _location;

  @override
  void initState() {
    super.initState();
    _isValid = widget.isValid;
  }

  @override
  void didUpdateWidget(covariant LocationFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isValid = widget.isValid;
  }

  void setPreviewImageUrl({required LatLng position}) {
    final String staticMapImageUrl = _mapsService.generateLocationPreviewImage(
      position: position,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });

    widget.onPositionSelected(position);
  }

  Future<void> _getLocation() async {
    final LocationData locationData = await Location().getLocation();

    setState(() {
      _location = locationData;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    try {
      _location ?? await _getLocation();

      if (!mounted) throw 'Component not mounted';

      final LatLng selectedLocation = LatLng(
        _location!.latitude!,
        _location!.longitude!,
      );

      setPreviewImageUrl(position: selectedLocation);
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => const AlertError(
          message:
              'Could not fetch location. Check permission to access device locations.',
        ),
      );
    }
  }

  Future<void> _selectOnMap() async {
    try {
      _location ?? await _getLocation();

      if (!mounted) throw 'Component not mounted';

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

      if (selectedLocation == null || !mounted) {
        return;
      }

      setPreviewImageUrl(position: selectedLocation);

      setState(() {
        _isValid = true;
      });
    } catch (_) {
      showDialog(
        context: context,
        builder: (_) => const AlertError(
          message:
              'Could not fetch location. Check permission to access device locations.',
        ),
      );

      setState(() {
        _isValid = false;
      });
    }
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
                color: _isValid ? Colors.grey : Colors.red,
                width: 1,
              ),
            ),
            child: SizedBox(
              height: isLandscape
                  ? mediaQuery.size.height * 0.5
                  : mediaQuery.size.height * 0.35,
              width: double.infinity,
              child: _previewImageUrl == null
                  ? Center(
                      child: Text(
                        'No location chosen',
                        style: TextStyle(
                          color: _isValid ? Colors.black : Colors.red,
                        ),
                      ),
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
