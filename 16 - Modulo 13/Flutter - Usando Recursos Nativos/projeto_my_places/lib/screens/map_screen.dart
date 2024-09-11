import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_my_places/models/coordinate.dart';
import 'package:uuid/uuid.dart';

class MapScreen extends StatefulWidget {
  final Coordinate coordinates;
  final bool isReadOnly;

  const MapScreen({
    super.key,
    this.isReadOnly = false,
    required this.coordinates,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
        actions: [
          if (!widget.isReadOnly)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _pickedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
            ),
        ],
      ),
      body: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.coordinates.latitude,
              widget.coordinates.longitude,
            ),
            zoom: 16,
          ),
          onTap: widget.isReadOnly ? null : _selectLocation,
          markers: _pickedLocation == null && !widget.isReadOnly
              ? {}
              : {
                  Marker(
                    markerId: MarkerId(const Uuid().v4()),
                    position: _pickedLocation ??
                        LatLng(
                          widget.coordinates.latitude,
                          widget.coordinates.longitude,
                        ),
                  ),
                },
        ),
      ),
    );
  }
}
