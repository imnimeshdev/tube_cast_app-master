
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
 import 'package:tube_cast_app/Work%20Experience/work_experience.dart';



class ProfessionalDetails extends StatefulWidget {
  const ProfessionalDetails({super.key});

  @override
  State<ProfessionalDetails> createState() => _ProfessionalDetailsState();
}

class _ProfessionalDetailsState extends State<ProfessionalDetails> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController  professionController = TextEditingController();
  final TextEditingController  currentcityController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController specialskillsController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();


  List<String> variantsList = [
    'English',
    "Assamese",
    "Bengali (Bangla)",
    "Bodo",
    "Dogri",
    "Gujarati",
    "Hindi",
    "Kannada",
    "Kashmiri",
    "Konkani",
    "Maithili",
    'Malayalam',
    'Meitei',
    'Marathi',
    'Nepali',
    'Odia',
    'Punjabi',
    "Sanskrit",
    'Santali',
    'Sindhi',
    'Tamil',
    'Telugu',
    'Urudu'
  ];
  List<String> selectedCheckBoxValue = [];




  @override
  void initState() {
    super.initState();
    loadPageData();
    //loadSelectedLanguages();

  }
  // void loadSelectedLanguages() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? selectedLanguagesFromPrefs = prefs.getStringList('selectedLanguages');
  //   if (selectedLanguagesFromPrefs != null) {
  //     setState(() {
  //       selectedCheckBoxValue = selectedLanguagesFromPrefs;
  //     });
  //   }
  // }


  void loadPageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      professionController.text = prefs.getString('profession') ?? '';
      currentcityController.text = prefs.getString('city') ?? '';
      qualificationController.text = prefs.getString('qualification') ?? '';
      specialskillsController.text = prefs.getString('skills') ?? '';
      aboutController.text = prefs.getString('about') ?? '';
      selectedCheckBoxValue = prefs.getStringList('selectedLanguages') ?? [];


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
                                    "Professional Details",
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
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Allow only letters and spaces


                                  TextInputFormatter.withFunction((oldValue, newValue) {
                                    // Allow spaces unless it's the only character
                                    if (newValue.text == ' ') {
                                      return oldValue;
                                    }
                                    return newValue;
                                  }),
                                ],
                                controller: professionController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Profession';
                                  }

                                  return null; // Return null if the validation passes
                                },

                                decoration: const InputDecoration(
                                  contentPadding:   EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  border:   OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintText: 'Profession',
                                  hintStyle: TextStyle(color: Colors.black),

                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Allow only letters and spaces

                                  TextInputFormatter.withFunction((oldValue, newValue) {
                                    // Allow spaces unless it's the only character
                                    if (newValue.text == ' ') {
                                      return oldValue;
                                    }
                                    return newValue;
                                  }),
                                ],
                                controller: currentcityController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter city';
                                  }

                                  return null; // Return null if the validation passes
                                },

                                decoration: const InputDecoration(
                                  contentPadding:   EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  border:   OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintText: 'Current City',
                                  hintStyle: TextStyle(color: Colors.black),

                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')), // Allow letters, numbers, and spaces

                                  TextInputFormatter.withFunction((oldValue, newValue) {
                                    // Allow spaces unless it's the only character
                                    if (newValue.text == ' ') {
                                      return oldValue;
                                    }
                                    return newValue;
                                  }),
                                ],
                                controller: qualificationController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter qualification';
                                  }

                                  return null; // Return null if the validation passes
                                },

                                decoration: const InputDecoration(
                                  contentPadding:   EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  border:   OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintText: 'Qualification',
                                  hintStyle: TextStyle(color: Colors.black),

                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),

                              CustomDropdown<String>.multiSelect(
                                hintText: 'Languages',
                                decoration: CustomDropdownDecoration(
                                  hintStyle: const TextStyle(fontSize: 15, color: Colors.black),
                                  errorStyle: const TextStyle(fontSize: 12),
                                  closedErrorBorderRadius: const BorderRadius.all(Radius.circular(4)),
                                  closedBorder: Border.all(color: Colors.black, width: 1),
                                  closedBorderRadius: const BorderRadius.all(Radius.circular(4)),
                                  closedFillColor: Colors.white,
                                  closedErrorBorder: Border.all(color: Colors.black),
                                ),
                                items: variantsList,
                                initialItems: selectedCheckBoxValue,
                                onListChanged: (value) async {
                                  setState(() {
                                    selectedCheckBoxValue = value;
                                  });
                                  try {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    await prefs.setStringList('selectedLanguages', value);
                                  } catch (e) {
                                    print('Error storing selected languages: $e');
                                  }
                                },
                                listValidator: (value) => value.isEmpty ? "Select language" : null,
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline, // Enable multiline input
                                inputFormatters: [
                                  TextInputFormatter.withFunction((oldValue, newValue) {
                                    if (newValue.text == ' ') {
                                      return oldValue;
                                    }
                                    return newValue;
                                  }),
                                ],
                                controller: specialskillsController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter special skills';
                                  }
                                  return null; // Return null if the validation passes
                                },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintText: 'Special Skills (50 Words)',
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline, // Enable multiline input
                                inputFormatters: [
                                  TextInputFormatter.withFunction((oldValue, newValue) {
                                    if (newValue.text == ' ') {
                                      return oldValue;
                                    }
                                    return newValue;
                                  }),
                                ],
                                controller: aboutController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter about yourself';
                                  }
                                  return null; // Return null if the validation passes
                                },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintText: 'About Yourself (50 Words)',
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
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
                                            await prefs.setString('profession', professionController.text);
                                            await prefs.setString('city', currentcityController.text);
                                            await prefs.setString('qualification', qualificationController.text);
                                            await prefs.setString('skills', specialskillsController.text);
                                            await prefs.setString('about', aboutController.text);



                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                            const WorkExperience(),
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
