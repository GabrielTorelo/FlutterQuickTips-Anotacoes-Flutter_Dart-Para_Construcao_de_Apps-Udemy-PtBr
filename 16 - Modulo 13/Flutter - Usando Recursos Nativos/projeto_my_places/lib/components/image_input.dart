import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function(File pickedImage) onImageSelected;

  const ImageInput({
    super.key,
    required this.onImageSelected,
  });

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  _takePicture() async {
    final Directory appDir = await syspaths.getApplicationDocumentsDirectory();
    final ImagePicker picker = ImagePicker();

    XFile imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    setState(() {
      _storedImage = File(imageFile.path);
    });

    final File savedImage = await _storedImage!.copy(
      '${appDir.path}/${path.basename(_storedImage!.path)}',
    );

    widget.onImageSelected(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.center,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: SizedBox(
                  width: 180,
                  height: 100,
                  child: Center(
                    child: _storedImage == null
                        ? const Text('No Image')
                        : Image.file(
                            _storedImage!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            label: const Text('Take Picture'),
            icon: const Icon(Icons.camera),
            onPressed: _takePicture,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
