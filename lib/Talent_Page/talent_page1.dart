 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tube_cast_app/Talent_Page/talent_page2.dart';


 // class UserData {
 //   final String name;
 //   final String email;
 //   final String phoneNumber;
 //   final String genderdropdown;
 //
 //   UserData({required this.name, required this.email, required this.phoneNumber,required this.genderdropdown});
 // }


class TalentPage1 extends StatefulWidget {
  const TalentPage1({super.key});

  @override
  State<TalentPage1> createState() => _TalentPage1State();
}

class _TalentPage1State extends State<TalentPage1> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobilController = TextEditingController();
  String? genderdropdown;
  String? categoryDropdown;
  String? subcategoryDropdown;



  @override
  void initState() {
    super.initState();
    loadPageData();
  }

  void loadPageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      mobilController.text = prefs.getString('mobile') ?? '';
      genderdropdown= prefs.getString('gender') ?? genderdropdown?[0];
      categoryDropdown= prefs.getString('category') ?? categoryDropdown?[0];
      subcategoryDropdown= prefs.getString('subcategory') ?? subcategoryDropdown?[0];
    });
  }



  List<String> categories = [
    'Film Technicians',
    'Director/Writer/Art Director/Casting Director/Storyboard Artist',
    'Anchors/VJ/RJ/DJ/Stand up Comedians',
    'Dance/Stunt',
    'Model/Influencer/Vlogger',
    'Music/Band',
    'Film Artist/Tv Artist/Theatre Artist/Dubbing Artist',
    'Cinematographer/Photographer',
    'Costume/Make-up hair/Both',
    'Production',
  ];

  Map<String, List<String>> subcategories = {
    'Film Technicians': ['Editor','VFX','SFX','DI','Colorist','Animation','Sound Engineer','Others', 'Art'],
    'Director/Writer/Art Director/Casting Director/Storyboard Artist': ['Director','Writer','Art Director','Casting Director','Storyboard Artist'],
    'Anchors/VJ/RJ/DJ/Stand up Comedians':['Anchors','VJ','RJ','DJ','Standup Comedians'],
    'Dance/Stunt':['Choreographer', 'Dancer','Dance Coordinator','Stunt man', 'Stunt director','Stunt coordinators', 'others'],
    'Model/Influencer/Vlogger':['Model','Influencer','Vlogger'],
    'Music/Band':['Singer','Music Director','Instrumentalist', 'Band'],
    'Film Artist/Tv Artist/Theatre Artist/Dubbing Artist':['Film Artist/Tv Artist/Dubbing Artist','Theatre Artist'],
    'Cinematographer/Photographer':['Cinemateography','Film Photography','Fashion Photography'],
    'Costume/Make-up hair/Both':['Films', 'Fashion', 'Both'],
    'Production':['Production Assistant','Film crew','Executive producer','Line Producer','Production Designer','Producer','Creative Producer', 'Casting Director']


   };



  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Form(
        key: _formkey,
        child:     SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60),
                child: const Center(
                  child: Text("Talent", style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 30
                  ),),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              Container(
                color: Colors.black,
                 width: 400,


                child: Container(
                  padding: const EdgeInsets.all(20),
                  child:   Column(
                    children: [
                      const Row(
                        children: [Text("Register as Talent", style: TextStyle(color: Colors.orange, fontSize: 16),),],),
                      const SizedBox(height: 10,),
                      const Text("Become our Member and Growing with us Together", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w700),),

                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.orange, fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        color: Colors.white,
                           child: Container(
                          padding: const EdgeInsets.all(20),
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
                                  border: Border.all(color: Colors.black, width: 2.0), // Circle outline color and width
                                ),
                                child: Center(
                                  child: Container(
                                    width: 3,
                                    height: 3,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black, // Dot color
                                    ),
                                  ),
                                ),
                                ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text("Categories Details",style: TextStyle(color: Colors.black, fontWeight:FontWeight.w600,fontSize: 16)),
                              ],
                            ),
                              const SizedBox(
                                height: 10,
                              ),
                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white, // Set background color of dropdown options to white
                                isExpanded: true,
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
                                  hintText: 'Categories',
                                  hintStyle: TextStyle(color: Colors.black), // Set hint text color to black

                                ),
                                value: categoryDropdown,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    categoryDropdown = newValue;
                                    subcategoryDropdown = null; // Reset subcategory dropdown when category changes
                                  });
                                },
                                items: categories.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width, // Set width to screen width
                                      child: Text(
                                        value,
                                        softWrap: true, // Allow text to wrap to the next line
                                        overflow: TextOverflow.clip, // Clip overflow text
                                      ),
                                    ),
                                  );
                                }).toList(),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null) {
                                    return 'Select categories';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white, // Set background color of dropdown options to white
                                isExpanded: true,
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
                                ),
                                value: subcategoryDropdown,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    subcategoryDropdown = newValue;
                                  });
                                },
                                items: [
                                  const DropdownMenuItem<String>(
                                    value: null,
                                    child: Text('Sub-Category',
                                    style: TextStyle(color: Colors.black),

                                    ), // Empty item to create space for the hint
                                  ),
                                  ...(subcategories[categoryDropdown] != null
                                      ? subcategories[categoryDropdown]!.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList()
                                      : []),
                                ],
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null) {
                                    return 'Select sub-category';
                                  }
                                  return null;
                                },
                                hint: const Text(
                                  'Categories',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black, // Customize the color of the hint text
                                  ),
                                ),
                              ),

                               const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z.]"))],
                                cursorColor: Colors.black,
                                controller: nameController,
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

                                autovalidateMode: AutovalidateMode.onUserInteraction,

                                validator:  (value) {
                                  if (value!.isEmpty ) {
                                    return 'Enter Name';

                                  }
                                  else if(value.isEmpty && !RegExp('a-zA-Z').hasMatch(value)){
                                    return 'Please enter valid Name';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                cursorColor: Colors.black,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  bool emailValid  = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value!);

                                  if (value.isEmpty) {
                                    return 'Enter Your Email Id';
                                  }else if (emailValid == false) {
                                    return 'Please enter valid email Id';
                                  }

                                  return null;
                                },
                                textInputAction: TextInputAction.next,
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



                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                ],
                                cursorColor: Colors.black,
                                controller: mobilController,
                                keyboardType: TextInputType.number,

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

                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Your Mobile No';
                                  } else if (value.length != 10) {
                                    return 'Enter Your Valid Mobile No';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(
                                  height: 15),


                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Gender',
                                  style:   TextStyle(color: Colors.black)
                                ),

                                value: genderdropdown,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    genderdropdown = newValue!;
                                  });
                                },
                                items: <String>['Male', 'Female', 'Transgender'].map<DropdownMenuItem<String>>((String value) {
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
                                validator:  (genderdropdown) {
                                  if (genderdropdown == null ) {
                                    return 'Select Gender';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formkey.currentState!.validate()  ) {
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      await prefs.setString('name', nameController.text);
                                      await prefs.setString('email', emailController.text);
                                      await prefs.setString('mobile', mobilController.text);
                                      await prefs.setString('gender', genderdropdown!);
                                      await prefs.setString('category', categoryDropdown!);
                                      await prefs.setString('subcategory', subcategoryDropdown!);



                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TalentPage2(
                                            name: nameController.text,
                                            email: emailController.text,
                                            mobile: mobilController.text,
                                            gender: genderdropdown!,
                                          ),
                                        ),
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
                              )


                            ],
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
