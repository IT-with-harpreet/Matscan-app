import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(const MatscanApp());

class MatscanApp extends StatelessWidget {
  const MatscanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matscan - Waste Management',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ImagePickerExample(),
    );
  }
}

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({super.key});

  @override
  ImagePickerExampleState createState() => ImagePickerExampleState(); // State class is now public
}

class ImagePickerExampleState extends State<ImagePickerExample> {  // Made public
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _captureImageWithCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matscan - Image Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? const Text('No image selected.')
                : Image.file(
                    _image!,
                    height: 200,
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImageFromGallery,
              child: const Text('Pick Image from Gallery'),
            ),
            ElevatedButton(
              onPressed: _captureImageWithCamera,
              child: const Text('Capture Image with Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
