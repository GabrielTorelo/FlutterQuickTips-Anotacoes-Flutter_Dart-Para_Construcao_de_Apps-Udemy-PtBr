import 'package:flutter/material.dart';
import 'package:projeto_my_places/providers/great_places.dart';
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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadDatabase(),
        builder: (ctx, snapshot) {
          return switch (snapshot.connectionState) {
            ConnectionState.waiting => const Center(
                child: CircularProgressIndicator(),
              ),
            ConnectionState.done => Consumer<GreatPlaces>(
                child: Center(
                  child: Text(
                    'No places\nregistered!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                builder: (ctx, GreatPlaces, child) => GreatPlaces.placesCount ==
                        0
                    ? child!
                    : ListView.builder(
                        itemCount: GreatPlaces.placesCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(GreatPlaces.placeByIndex(i).image),
                          ),
                          title: Text(GreatPlaces.placeByIndex(i).title),
                          subtitle: Text(
                              GreatPlaces.placeByIndex(i).location.address),
                          onTap: () {},
                        ),
                      ),
              ),
            _ => const Placeholder(),
          };
        },
      ),
    );
  }
}
