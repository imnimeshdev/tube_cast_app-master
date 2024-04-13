import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  String? _imageName;
  final picker = ImagePicker();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  String? _errorMessage;
  final List<String> _lastSelectedImageNames = List.filled(3, ''); // List to store the names of the last selected images

  @override
  void initState() {
    super.initState();
    _loadSavedImageNames();
  }

  _loadSavedImageNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _controller1.text = prefs.getString('image1') ?? '';
      _controller2.text = prefs.getString('image2') ?? '';
      _controller3.text = prefs.getString('image3') ?? '';
      _lastSelectedImageNames[0] = prefs.getString('image1') ?? '';
      _lastSelectedImageNames[1] = prefs.getString('image2') ?? '';
      _lastSelectedImageNames[2] = prefs.getString('image3') ?? '';
    });
  }

  Future getImage(TextEditingController controller, int index) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        // Check file type and size
        if (_isValidFileType(imageFile) && _isValidFileSize(imageFile)) {
          _imageName = pickedFile.path.split('/').last;
          controller.text = _imageName!;
          _lastSelectedImageNames[index] = _imageName!;
          _saveImageName(_imageName!, index);
        } else {
          // Show error message if file doesn't meet conditions
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                "Please select a valid image file (.jpg, .jpeg, .png) not exceeding 5MB."),
          ));
        }
      } else {
        print('No image selected.');
      }
    });
  }

  _saveImageName(String imageName, int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch(index) {
      case 0:
        prefs.setString('image1', imageName);
        break;
      case 1:
        prefs.setString('image2', imageName);
        break;
      case 2:
        prefs.setString('image3', imageName);
        break;
    }
  }

  bool validateImagesUploaded() {
    if (_controller1.text.isNotEmpty ||
        _controller2.text.isNotEmpty ||
        _controller3.text.isNotEmpty) {
      return true; // At least one image uploaded
    } else {
      return false; // No image uploaded
    }
  }

  bool _isValidFileType(File file) {
    List<String> validExtensions = ['.jpg', '.jpeg', '.png'];
    String extension = path.extension(file.path).toLowerCase();
    return validExtensions.contains(extension);
  }

  bool _isValidFileSize(File file) {
    int maxSize = 5 * 1024 * 1024; // 5MB in bytes
    int fileSize = file.lengthSync();
    return fileSize <= maxSize;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _controller1,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Upload Photo 1",
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.none,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                suffixIcon: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(30, 20),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () => getImage(_controller1, 0), // Pass index 0 for the first controller
                  child: const Text(
                    "Browse",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                getImage(_controller1, 0);
                // Reset error message
                setState(() {
                  _errorMessage = null;
                });
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _controller2,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Upload Photo 2",
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.none,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                suffixIcon: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(30, 20),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () => getImage(_controller2, 1), // Pass index 1 for the second controller
                  child: const Text(
                    "Browse",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                getImage(_controller2, 1);
                // Reset error message
                setState(() {
                  _errorMessage = null;
                });
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _controller3,
              readOnly: true,
              decoration: InputDecoration(
                hintText:   "Upload Photo 3",
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.none,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                errorText: _controller3.text.isEmpty ? _errorMessage : null,
                suffixIcon: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(30, 20),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () async {
                    await getImage(_controller3, 2); // Pass index 2 for the third controller
                    // Reset error message
                    setState(() {
                      _errorMessage = null;
                    });
                  },
                  child: const Text(
                    "Browse",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                getImage(_controller3, 2);
                // Reset error message
                setState(() {
                  _errorMessage = null;
                });
              },
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                if (!validateImagesUploaded()) {
                  setState(() {
                    _errorMessage = "Please upload at least one image";
                  });
                } else {
                  // Save the names of the last selected images
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('lastSelectedImage1', _lastSelectedImageNames[0]);
                  prefs.setString('lastSelectedImage2', _lastSelectedImageNames[1]);
                  prefs.setString('lastSelectedImage3', _lastSelectedImageNames[2]);
                  // Clear error message if validation passes
                  setState(() {
                    _errorMessage = null;
                  });
                  // Proceed with form submission
                  print("Form submitted successfully!");
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ImageUploadScreen(),
  ));
}
