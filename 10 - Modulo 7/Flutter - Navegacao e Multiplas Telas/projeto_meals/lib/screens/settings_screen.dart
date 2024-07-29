import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final void Function(Settings settings) onSettingsChanged;

  const SettingsScreen(
    this.onSettingsChanged,
    this.settings, {
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelSmall,
      ),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          _createSwitch(
            context,
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals',
            value: settings.isGlutenFree,
            onChanged: (value) {
              setState(() {
                settings.isGlutenFree = value;
              });
            },
          ),
          _createSwitch(
            context,
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals',
            value: settings.isLactoseFree,
            onChanged: (value) {
              setState(() {
                settings.isLactoseFree = value;
              });
            },
          ),
          _createSwitch(
            context,
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            value: settings.isVegetarian,
            onChanged: (value) {
              setState(() {
                settings.isVegetarian = value;
              });
            },
          ),
          _createSwitch(
            context,
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            value: settings.isVegan,
            onChanged: (value) {
              setState(() {
                settings.isVegan = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
