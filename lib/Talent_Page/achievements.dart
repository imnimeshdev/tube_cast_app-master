import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tube_cast_app/Talent_Page/titles.dart';

class Acheivements extends StatefulWidget {
  const Acheivements({Key? key});

  @override
  State<Acheivements> createState() => _AcheivementsState();
}

class _AcheivementsState extends State<Acheivements> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController acheivement1Controller = TextEditingController();
  final TextEditingController acheivement2Controller = TextEditingController();
  final TextEditingController acheivement3Controller = TextEditingController();
  final TextEditingController acheivement4Controller = TextEditingController();
  final TextEditingController acheivement5Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPageData();
  }

  void loadPageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      acheivement1Controller.text = prefs.getString('acheivement1Controller') ?? '';
      acheivement2Controller.text = prefs.getString('acheivement2Controller') ?? '';
      acheivement3Controller.text = prefs.getString('acheivement3Controller') ?? '';
      acheivement4Controller.text = prefs.getString('acheivement4Controller') ?? '';
      acheivement5Controller.text = prefs.getString('acheivement5Controller') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                      ),
                      const SizedBox(height: 10),
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
                      const SizedBox(height: 30),
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
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
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
                                    "Achievements",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "(75 characters)",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              buildTextFormField('', acheivement1Controller),
                              const SizedBox(
                                height: 15,
                              ),
                              buildTextFormField('', acheivement2Controller),
                              const SizedBox(
                                height: 15,
                              ),
                              buildTextFormField('', acheivement3Controller),
                              const SizedBox(
                                height: 15,
                              ),
                              buildTextFormField('', acheivement4Controller),
                              const SizedBox(
                                height: 15,
                              ),
                              buildLastTextFormField('', acheivement5Controller),
                              const SizedBox(
                                height: 15,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
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
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: const RoundedRectangleBorder(),
                                        ),
                                        onPressed: () async {
                                          if (_formkey.currentState!.validate()) {
                                            SharedPreferences prefs = await SharedPreferences.getInstance();
                                            await prefs.setString('acheivement1Controller', acheivement1Controller.text);
                                            await prefs.setString('acheivement2Controller', acheivement2Controller.text);
                                            await prefs.setString('acheivement3Controller', acheivement3Controller.text);
                                            await prefs.setString('acheivement4Controller', acheivement4Controller.text);
                                            await prefs.setString('acheivement5Controller', acheivement5Controller.text);
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Titles(),));
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

  Widget buildTextFormField(String label, TextEditingController controller) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Allow only letters and spaces
        TextInputFormatter.withFunction((oldValue, newValue) {
          if (newValue.text == ' ') {
            return oldValue;
          }
          return newValue;
        }),
      ],
      cursorColor: Colors.black,
      controller: controller,
      maxLength: 75, // Set maximum length
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        labelText: label,
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
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty &&
            acheivement1Controller.text.isEmpty &&
            acheivement2Controller.text.isEmpty &&
            acheivement3Controller.text.isEmpty &&
            acheivement4Controller.text.isEmpty &&
            acheivement5Controller.text.isEmpty &&
            controller == acheivement5Controller) {
          return 'Enter at least one achievement';
        }
        return null;
      },
      onChanged: (_) {
        setState(() {
          _formkey.currentState!.validate();
        });
      },
    );
  }

  Widget buildLastTextFormField(String label, TextEditingController controller) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Allow only letters and spaces
        TextInputFormatter.withFunction((oldValue, newValue) {
          if (newValue.text == ' ') {
            return oldValue;
          }
          return newValue;
        }),
      ],
      controller: controller,
      maxLength: 75, // Set maximum length
      keyboardType: TextInputType.multiline,
      maxLines: null,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: label,
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
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty &&
            acheivement1Controller.text.isEmpty &&
            acheivement2Controller.text.isEmpty &&
            acheivement3Controller.text.isEmpty &&
            acheivement4Controller.text.isEmpty &&
            acheivement5Controller.text.isEmpty) {
          return 'Enter at least one achievement';
        }
        return null;
      },
      onChanged: (_) {
        setState(() {
          _formkey.currentState!.validate();
        });
      },
    );
  }
}
