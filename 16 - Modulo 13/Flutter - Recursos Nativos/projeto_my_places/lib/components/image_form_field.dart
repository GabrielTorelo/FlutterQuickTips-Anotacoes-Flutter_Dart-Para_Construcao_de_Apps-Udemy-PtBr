import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:projeto_my_places/components/alert_error.dart';

class ImageFormField extends StatefulWidget {
  final Function(File pickedImage) onImageSelected;
  final bool isValid;

  const ImageFormField({
    super.key,
    required this.onImageSelected,
    required this.isValid,
  });

  @override
  State<ImageFormField> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageFormField> {
  bool _isValid = true;
  File? _storedImage;

  @override
  void initState() {
    super.initState();
    _isValid = widget.isValid;
  }

  @override
  void didUpdateWidget(covariant ImageFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isValid = widget.isValid;
  }

  _takePicture() async {
    try {
      final Directory appDir =
          await syspaths.getApplicationDocumentsDirectory();
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

      if (!mounted) throw 'Component not mounted';

      widget.onImageSelected(savedImage);

      setState(() {
        _isValid = true;
      });
    } catch (_) {
      showDialog(
        context: context,
        builder: (_) => const AlertError(
          message:
              'Could not fetch location. Check permission to access device camera.',
        ),
      );

      setState(() {
        _isValid = false;
      });
    }
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
                  border: Border.all(
                    width: 1,
                    color: _isValid ? Colors.grey : Colors.red,
                  ),
                ),
                child: SizedBox(
                  width: 180,
                  height: 100,
                  child: Center(
                    child: _storedImage == null
                        ? Text('No Image',
                            style: TextStyle(
                              color: _isValid ? Colors.black : Colors.red,
                            ))
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
          TextButton.icon(
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
