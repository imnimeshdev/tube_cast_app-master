import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tube_cast_app/Talent_Page/professional_details.dart';

enum HeightUnit { feet, cm }


class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _fburlController = TextEditingController();
  final TextEditingController _instagramUrlController = TextEditingController();
  final TextEditingController _xController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController  weightController = TextEditingController();
  String? skindropdown;
  TextEditingController heightController = TextEditingController();
  HeightUnit selectedUnit = HeightUnit.feet; // Default unit is feet



  bool isFacebookUrl(String url) {
    // Regular expression pattern for a Facebook URL
    RegExp regExp = RegExp(
      r'^https?:\/\/(www\.)?facebook\.com\/.+$',
      caseSensitive: false,
    );

    // Check if the URL matches the pattern
    return regExp.hasMatch(url);
  }


  @override
  void initState() {
    super.initState();
    loadPageData();
  }

  void loadPageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _fburlController.text = prefs.getString('fb') ?? '';
      _instagramUrlController.text = prefs.getString('inst') ?? '';
      _xController.text = prefs.getString('x') ?? '';
      ageController.text = prefs.getString('age') ?? '';
      weightController.text = prefs.getString('weight') ?? '';
      heightController.text = prefs.getString('height') ?? '';
      skindropdown= prefs.getString('skin') ?? skindropdown?[0];

    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
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
                                    "Social Media",
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
                                controller: _fburlController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an Instagram link.';
                                  }
                                  // Check if the URL contains "instagram.com" as a substring
                                  if (!value.contains('facebook.com')) {
                                    return 'Please enter a valid Facebook link.';
                                  }
                                  return null; // Return null if the validation passes
                                },

                                decoration: InputDecoration(
                                  contentPadding:   const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  border:   const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintText: 'Link',
                                  hintStyle: const TextStyle(color: Colors.black),
                                  prefixIcon: Container(
                                    width: 40,
                                    height: 40,
                                    color: Colors.blue.shade900,
                                    child: const Icon(
                                      Icons.facebook_sharp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  prefix: const SizedBox(width: 5),
                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _instagramUrlController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an Instagram link.';
                                  }
                                  // Check if the URL contains "instagram.com" as a substring
                                  if (!value.contains('instagram.com')) {
                                    return 'Please enter a valid Instagram link.';
                                  }
                                  return null; // Return null if the validation passes
                                },

                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintText: 'Link',
                                  hintStyle: const TextStyle(color: Colors.black),
                                  prefixIcon: Container(
                                    width: 40,
                                    height: 40,
                                    color: Colors.pink.shade400,
                                    child: const Icon(
                                      Icons.camera,
                                      color: Colors.white,
                                    ),
                                  ),
                                  prefix: const SizedBox(width: 5),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _xController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an X link.';
                                  }
                                  // Check if the URL contains "x.com" as a substring
                                  if (!value.contains('x.com')) {
                                    return 'Please enter a valid X link.';
                                  }
                                  return null; // Return null if the validation passes
                                },

                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintText: 'Link',
                                  hintStyle: const TextStyle(color: Colors.black),
                                  prefixIcon: Container(
                                    width: 40,
                                    height: 40,
                                    color: Colors.blue,
                                    child: const Icon(
                                      Icons.backup_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  prefix: const SizedBox(width: 5),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
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
                                    "Profile",
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
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number, // Allow only numeric input
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: ageController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly, // Restrict input to digits
                                  LengthLimitingTextInputFormatter(2), // Limit input length to 2 characters
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter age';
                                  }
                                  int? age = int.tryParse(value);
                                  if (age == null || age <= 0 || age > 99) {
                                    return 'Please enter a valid age between 1 and 99.';
                                  }
                                  return null; // Return null if the validation passes
                                },
                                 decoration: InputDecoration(
                                  hintText: "Age",
                                   border: const OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.grey),
                                   ),
                                   focusedBorder: const OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.black),
                                   ),
                                   errorBorder: const OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.black),
                                   ),
                                   focusedErrorBorder: const OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.black),
                                   ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust vertical padding
                                  suffixIcon: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(30, 20), // Adjust the size here
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    child: const Text(
                                      "In Years",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                               ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number, // Allow only numeric input
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: heightController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly, // Restrict input to digits
                                  LengthLimitingTextInputFormatter(3), // Limit input length to 3 characters
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter height';
                                  }
                                  int? height = int.tryParse(value);
                                  if (height == null || height <= 0) {
                                    return 'Please enter a valid height.';
                                  }
                                  return null; // Return null if the validation passes
                                },
                                decoration: InputDecoration(
                                  hintText: "Height",
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust vertical padding
                                  suffixIcon: Container(
                                    width: 100,
                                    color: Colors.black, // Background color
                                    padding: const EdgeInsets.symmetric(horizontal: 8), // Adjust padding as needed
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<HeightUnit>(
                                        dropdownColor: Colors.black,
                                        icon: const Icon(Icons.arrow_drop_down, color: Colors.white), // Set the icon color to white

                                        value: selectedUnit,
                                        onChanged: (HeightUnit? newValue) {
                                          setState(() {
                                            selectedUnit = newValue!;
                                          });
                                        },
                                        items: <HeightUnit>[HeightUnit.feet, HeightUnit.cm]
                                            .map<DropdownMenuItem<HeightUnit>>((HeightUnit value) {
                                          return DropdownMenuItem<HeightUnit>(
                                            value: value,
                                            child: Text(value == HeightUnit.feet ? 'Feet' : 'Cm', style: const TextStyle(color: Colors.white)),

                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              TextFormField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number, // Allow only numeric input
                                controller: weightController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly, // Restrict input to digits
                                  LengthLimitingTextInputFormatter(3), // Limit input length to 2 characters
                                ],
                                autovalidateMode: AutovalidateMode.onUserInteraction,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter weight';
                                  }
                                   int? weight = int.tryParse(value);
                                  if (weight == null || weight <= 0 || weight > 200) {
                                    return 'Please enter a valid weight  ';
                                  }
                                  return null; // Return null if the validation passes
                                },
                                decoration: InputDecoration(
                                  hintText: "Weight",
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust vertical padding
                                  suffixIcon: SizedBox(
                                    width: 100,

                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(30, 20), // Adjust the size here
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(0),
                                        ),
                                      ),
                                      child: const Text(
                                        "KG",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  height: 15),


                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Skin Tone',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: skindropdown,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    skindropdown = newValue!;
                                  });
                                },
                                items: <String>['Fair', 'Medium', 'Olive','Deep'].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration:  const InputDecoration(
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black
                                      )
                                  ) ,
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(color:Colors.black)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black
                                      )
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey
                                      )
                                  ),
                                  filled: true,


                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator:  (skindropdown) {
                                  if (skindropdown == null ) {
                                    return 'Select skin tone';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 30,
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
                                          if (_formkey.currentState!.validate()) {
                                            SharedPreferences prefs = await SharedPreferences.getInstance();
                                            await prefs.setString('fb', _fburlController.text);
                                            await prefs.setString('inst', _instagramUrlController.text);
                                            await prefs.setString('x', _xController.text);
                                            await prefs.setString('age', ageController.text);
                                            await prefs.setString('weight', weightController.text);
                                            await prefs.setString('height', heightController.text);
                                            await prefs.setString('skin', skindropdown!);

                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                            const ProfessionalDetails(),
                                            ));
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
      ),
    );
  }
}
