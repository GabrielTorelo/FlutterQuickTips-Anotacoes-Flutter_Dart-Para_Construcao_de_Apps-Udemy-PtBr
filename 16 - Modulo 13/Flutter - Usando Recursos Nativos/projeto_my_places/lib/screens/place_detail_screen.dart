import 'package:flutter/material.dart';
import 'package:projeto_my_places/models/coordinate.dart';
import 'package:projeto_my_places/models/place.dart';
import 'package:projeto_my_places/screens/map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)?.settings.arguments as Place;

    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Text(
              place.location.address,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          TextButton.icon(
            label: const Text('View on Map'),
            icon: const Icon(Icons.map),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => MapScreen(
                    isReadOnly: true,
                    coordinates: Coordinate(
                      latitude: place.location.latitude,
                      longitude: place.location.longitude,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
