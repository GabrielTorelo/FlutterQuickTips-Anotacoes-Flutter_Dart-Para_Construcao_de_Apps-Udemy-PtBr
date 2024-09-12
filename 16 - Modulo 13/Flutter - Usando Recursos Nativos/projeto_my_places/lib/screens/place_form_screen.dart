import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_my_places/components/adaptative_form_field.dart';
import 'package:projeto_my_places/components/alert_error.dart';
import 'package:projeto_my_places/components/image_form_field.dart';
import 'package:projeto_my_places/components/location_form_field.dart';
import 'package:projeto_my_places/providers/great_places.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  bool _imageIsValid = true;
  bool _locationIsValid = true;
  LatLng? _selectedPosition;
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _selectPosition(LatLng position) {
    setState(() {
      _locationIsValid = true;
      _selectedPosition = position;
    });
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    if (_pickedImage == null) {
      setState(() {
        _imageIsValid = false;
      });

      return;
    } else if (_selectedPosition == null) {
      setState(() {
        _locationIsValid = false;
      });

      return;
    }

    _formKey.currentState?.save();

    Provider.of<GreatPlaces>(
      context,
      listen: false,
    )
        .addPlace(
      title: _titleController.text,
      image: _pickedImage!,
      position: _selectedPosition!,
    )
        .then(
      (_) {
        Navigator.of(context).pop();
      },
    ).catchError(
      (_) {
        showDialog(
          context: context,
          builder: (_) => const AlertError(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Form'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
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
                      AdaptativeTextFormField(
                        label: 'Title',
                        maxLength: 100,
                        controller: _titleController,
                        onFieldSubmitted: _submitForm,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          return switch (value?.trim()) {
                            '' || null => 'Please enter a title',
                            _ => value!.trim().length < 8
                                ? 'Title must be at least 8 characters long'
                                : null,
                          };
                        },
                      ),
                      ImageFormField(
                        onImageSelected: _selectImage,
                        isValid: _imageIsValid,
                      ),
                      LocationFormField(
                        onPositionSelected: _selectPosition,
                        isValid: _locationIsValid,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
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
      ),
    );
  }
}
