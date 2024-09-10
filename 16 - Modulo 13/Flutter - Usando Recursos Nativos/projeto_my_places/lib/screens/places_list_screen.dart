import 'package:flutter/material.dart';
import 'package:projeto_my_places/providers/grate_places.dart';
import 'package:projeto_my_places/routes/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.placeForm);
            },
          ),
        ],
      ),
      body: Consumer<GratePlaces>(
        child: Center(
          child: Text(
            'No places\nregistered!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        builder: (ctx, gratePlaces, child) => gratePlaces.placesCount == 0
            ? child!
            : ListView.builder(
                itemCount: gratePlaces.placesCount,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        FileImage(gratePlaces.placeByIndex(i).image),
                  ),
                  title: Text(gratePlaces.placeByIndex(i).title),
                  subtitle: Text(gratePlaces.placeByIndex(i).location.address),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
