import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_firebase_chat/components/alert_error.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File image) onImagePick;
  final File? initialImage;
  final bool error;

  const UserImagePicker({
    super.key,
    required this.onImagePick,
    this.initialImage,
    required this.error,
  });

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    _pickedImage = widget.initialImage;
  }

  Future<void> _pickImage() async {
    final pickedImageFile = await ImagePicker()
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    )
        .catchError(
      (_) {
        showDialog(
          context: context,
          builder: (_) => const AlertError(
            message: 'Error picking image',
          ),
        );

        return null;
      },
    );

    if (pickedImageFile == null) {
      return;
    }

    setState(() {
      _pickedImage = File(pickedImageFile.path);
    });

    widget.onImagePick(_pickedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: widget.error ? Colors.red : Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
          child: _pickedImage == null
              ? Icon(
                  Icons.person,
                  size: 40,
                  color: widget.error ? Colors.black : Colors.white,
                )
              : null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: const Text('Add Image'),
        ),
      ],
    );
  }
}
