import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projeto_my_places/components/image_input.dart';
import 'package:projeto_my_places/providers/grate_places.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GratePlaces>(
      context,
      listen: false,
    ).addPlace(
      _titleController.text,
      _pickedImage!,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Form'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    ImageInput(
                      onImageSelected: _selectImage,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
              label: const Text('Add Place'),
              icon: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.black,
              ),
              onPressed: _submitForm,
            ),
          ),
        ],
      ),
    );
  }
}
