import 'package:flutter/material.dart';
import 'package:meals/routes/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required void Function() onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Cooking Up?',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Ink(
            color: Theme.of(context).canvasColor,
            child: Column(
              children: [
                _createItem(
                  context,
                  icon: Icons.restaurant,
                  label: 'Meals',
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                  },
                ),
                const Divider(
                  height: 1,
                ),
                _createItem(
                  context,
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.settings);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
