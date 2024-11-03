import 'package:flutter/material.dart';
import 'package:projeto_my_places/components/alert_error.dart';
import 'package:projeto_my_places/models/coordinate.dart';
import 'package:projeto_my_places/models/place.dart';
import 'package:projeto_my_places/providers/great_places.dart';
import 'package:projeto_my_places/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  void _deletePlace(
    BuildContext context,
    Place place,
  ) {
    Provider.of<GreatPlaces>(context, listen: false)
        .deletePlace(place)
        .then(
          (_) => Navigator.of(context).pop(),
        )
        .catchError(
      (_) {
        showDialog(
          context: context,
          builder: (_) => const AlertError(
            message: 'Error deleting place! Try again later.',
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)?.settings.arguments as Place;

    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _deletePlace(context, place);
            },
          ),
        ],
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
