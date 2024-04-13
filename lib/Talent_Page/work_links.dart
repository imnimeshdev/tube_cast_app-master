import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tube_cast_app/Talent_Page/talent_page1.dart';

class WorkLinks extends StatefulWidget {
  const WorkLinks({super.key});

  @override
  State<WorkLinks> createState() => _WorkLinksState();
}

class _WorkLinksState extends State<WorkLinks> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController  link1Controller = TextEditingController();
  final TextEditingController  link2Controller = TextEditingController();
  final TextEditingController link3Controller = TextEditingController();
  final TextEditingController link4Controller = TextEditingController();
  final TextEditingController link5Controller = TextEditingController();



  @override
  void initState() {
    super.initState();
    loadPageData();
  }

  void loadPageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      link1Controller.text = prefs.getString('link1Controller') ?? '';
      link2Controller.text = prefs.getString('link2Controller') ?? '';
      link3Controller.text = prefs.getString('link3Controller') ?? '';
      link4Controller.text = prefs.getString('link4Controller') ?? '';
      link5Controller.text = prefs.getString('link5Controller') ?? '';


    });
  }




  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                                    "Work links",
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
                              buildTextFormField('', link1Controller),
                              const SizedBox(
                                height: 15,
                              ),
                              buildTextFormField('', link2Controller),
                              const SizedBox(
                                height: 15,
                              ),
                              buildTextFormField('', link3Controller),
                              const SizedBox(
                                height: 15,
                              ),
                              buildTextFormField('', link4Controller),
                              const SizedBox(
                                height: 15,
                              ),
                              buildLastTextFormField('', link5Controller),
                              const SizedBox(
                                height: 15,
                              ),
                              const SizedBox(
                                height: 15,
                              ),


                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formkey.currentState!.validate()) {
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      await prefs.setString('link1Controller', link1Controller.text);
                                      await prefs.setString('link2Controller', link2Controller.text);
                                      await prefs.setString('link3Controller', link3Controller.text);
                                      await prefs.setString('link4Controller', link4Controller.text);
                                      await prefs.setString('link5Controller', link5Controller.text);

                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Thank you for your response')),
                                      );


                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    shape: MaterialStateProperty.all<OutlinedBorder>(
                                      const RoundedRectangleBorder(
                                      ),
                                    ),
                                  ),
                                  child: const Text('Save & Proceed'),
                                ),
                              ),
                              //
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // Center(
                              //   child: ElevatedButton(
                              //     onPressed: ()  async {
                              //
                              //       final SharedPreferences prefs = await SharedPreferences.getInstance();
                              //       prefs.clear();
                              //       Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              //       const TalentPage1(),
                              //       ));
                              //       },
                              //      style: ButtonStyle(
                              //       backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              //       foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              //       shape: MaterialStateProperty.all<OutlinedBorder>(
                              //         const RoundedRectangleBorder(
                              //         ),
                              //       ),
                              //     ),
                              //     child: const Text('Clear Form'),
                              //   ),
                              // )


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
        // Validate only if no other fields are filled and this is the last field
        if (value!.isEmpty &&
            link1Controller.text.isEmpty &&
            link2Controller.text.isEmpty &&
            link3Controller.text.isEmpty &&
            link4Controller.text.isEmpty &&
            link5Controller.text.isEmpty &&
            controller == link5Controller) {
          return 'Enter atleast one work link';
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
        // Validate only if all fields are empty
        if (value!.isEmpty &&
            link1Controller.text.isEmpty &&
            link2Controller.text.isEmpty &&
            link3Controller.text.isEmpty &&
            link4Controller.text.isEmpty &&
            link5Controller.text.isEmpty) {
          return 'Enter atleast one work link';
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


