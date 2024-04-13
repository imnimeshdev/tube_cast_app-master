import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tube_cast_app/Talent_Page/socialMedia.dart';
 import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class TalentPage2 extends StatefulWidget {
  final String name;
  final String email;
  final String mobile;
  final String gender;

  const TalentPage2({
    Key? key,
    required this.name,
    required this.email,
    required this.mobile,
    required this.gender,
  }) : super(key: key);

  @override
  _TalentPage2State createState() => _TalentPage2State();
}

class _TalentPage2State extends State<TalentPage2> {
  final TextEditingController jobRoleController = TextEditingController();

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
    loadPageData();
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



  void loadPageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      jobRoleController.text = prefs.getString('job') ?? '';

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60),
                child: const Center(
                  child: Text(
                    "Talent",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                color: Colors.black,
                width: 400,
                 //height: 950,
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Hi, ${widget.name}',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                         color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black, width: 2.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 3,
                                      height: 3,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Personal Details",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: widget.name,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                isDense: true,
                                hintText: 'Name',
                                hintStyle: TextStyle(color: Colors.black), // Set hint text color to black
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ) ,
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.black
                                    )
                                ),
                              ),
                              readOnly: true,
                            ),
                            const SizedBox(height: 15),

                            TextFormField(
                              initialValue: widget.email,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                isDense: true,
                                hintText: 'Email Id',
                                hintStyle: TextStyle(color: Colors.black), // Set hint text color to black

                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ) ,
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.black
                                    )
                                ),
                              ),
                              readOnly: true,
                            ),
                            const SizedBox(height: 15),


                            TextFormField(
                              initialValue: widget.mobile,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                isDense: true,
                                hintText: 'Mobile No.',
                                hintStyle: TextStyle(color: Colors.black), // Set hint text color to black

                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ) ,
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.black
                                    )
                                ),
                              ),

                              readOnly: true,
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Allow only letters and spaces
                              ],
                              controller: jobRoleController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                isDense: true,
                                hintText: 'Job Role',
                                hintStyle: TextStyle(color: Colors.black), // Set hint text color to black

                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ) ,
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.black
                                    )
                                ),
                              ),

                            ),


                            const SizedBox(height: 15),
                            TextFormField(
                              initialValue: widget.gender,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                isDense: true,
                                hintText: 'Gender.',
                                hintStyle: TextStyle(color: Colors.black), // Set hint text color to black

                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey
                                    )
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                ) ,
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.black
                                    )
                                ),
                              ),

                              readOnly: true,
                            ),
                            const SizedBox(height: 15,),
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
                                _errorMessage = null;

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
                                _errorMessage = null;

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
                                    _errorMessage = null;

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

                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity, // Adjust width as needed
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: const RoundedRectangleBorder(),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Previous",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16), // Adjust spacing as needed
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity, // Adjust width as needed
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: const RoundedRectangleBorder(),
                                      ),
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
                                          await prefs.setString('job', jobRoleController.text);

                                          // Clear error message if validation passes
                                          setState(() {
                                            _errorMessage = null;
                                          });
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                          const SocialMedia(),
                                          ),
                                          );
                                          // Proceed with form submission
                                          print("Form submitted successfully!");
                                        }




                                       },

                                      child: const Text(
                                        "Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
