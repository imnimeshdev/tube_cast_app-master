import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
 import 'package:tube_cast_app/Work%20Experience/work_experience2.dart';

import '../Talent_Page/achievements.dart';



class WorkExperience3 extends StatefulWidget {
  const WorkExperience3({super.key});

  @override
  State<WorkExperience3> createState() => _WorkExperience3State();
}

class _WorkExperience3State extends State<WorkExperience3> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController promotionname1Controller = TextEditingController();
  final TextEditingController promotionname2Controller = TextEditingController();
  final TextEditingController promotionname3Controller = TextEditingController();
  final TextEditingController promotionname4Controller = TextEditingController();

  final TextEditingController promotionyear1Controller = TextEditingController();
  final TextEditingController promotionyear2Controller = TextEditingController();
  final TextEditingController promotionyear3Controller = TextEditingController();
  final TextEditingController promotionyear4Controller = TextEditingController();



  String? promotiondropdown1;
  String? promotiondropdown2;
  String? promotiondropdown3;
  String? promotiondropdown4;

  String? promotionrole1;
  String? promotionrole2;
  String? promotionrole3;
  String? promotionrole4;


  @override
  void initState() {
    super.initState();
    loadPageData();
    _loadSelectedOption();
  }

  void loadPageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      promotionname1Controller.text = prefs.getString('promotionname1Controller') ?? '';
      promotionname2Controller.text = prefs.getString('promotionname2Controller') ?? '';
      promotionname3Controller.text = prefs.getString('promotionname3Controller') ?? '';
      promotionname4Controller.text = prefs.getString('promotionname4Controller') ?? '';

      promotionyear1Controller.text = prefs.getString('promotionyear1Controller') ?? '';
      promotionyear2Controller.text = prefs.getString('promotionyear2Controller') ?? '';
      promotionyear3Controller.text = prefs.getString('promotionyear3Controller') ?? '';
      promotionyear4Controller.text = prefs.getString('promotionyear4Controller') ?? '';



    });
  }

  void _loadSelectedOption() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      promotiondropdown1 = prefs.getString('promotiondropdown1') ?? null;
      promotiondropdown2 = prefs.getString('promotiondropdown2') ?? null;
      promotiondropdown3 = prefs.getString('promotiondropdown3') ?? null;
      promotiondropdown4 = prefs.getString('promotiondropdown4') ?? null;

      promotionrole1 = prefs.getString('promotionrole1') ?? null;
      promotionrole2 = prefs.getString('promotionrole2') ?? null;
      promotionrole3 = prefs.getString('promotionrole3') ?? null;
      promotionrole4 = prefs.getString('promotionrole4') ?? null;


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
                                    "Work Experience",
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
                                                            const Text(
                                "Brand Promotions / Shows & Events / Magazines / E-Commerce",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: promotiondropdown1,
                                onChanged: (String? newValue) async {
                                  setState(() {
                                    promotiondropdown1 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('promotiondropdown1', newValue!);
                                },
                                items: <String>['Brand Promotions', 'Shows & Events', 'Maganizes','E-commerence'].map<DropdownMenuItem<String>>((String value) {
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
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: promotionname1Controller,
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

                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: promotionyear1Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Year',
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

                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select Role',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: promotionrole1,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    promotionrole1 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('promotionrole1', newValue!);
                                },
                                items: <String>['Editor', 'Assistant Editor', 'Supporting Technician','Junior Editor','Other'].map<DropdownMenuItem<String>>((String value) {
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
                              ),
                                                            const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),


                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: promotiondropdown2,
                                onChanged: (String? newValue) async {
                                  setState(() {
                                    promotiondropdown2 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('promotiondropdown2', newValue!);
                                },
                                items: <String>['Brand Promotions', 'Shows & Events', 'Maganizes','E-commerence'].map<DropdownMenuItem<String>>((String value) {
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
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: promotionname2Controller,
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

                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: promotionyear2Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Year',
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

                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select Role',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: promotionrole2,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    promotionrole2 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('promotionrole2', newValue!);
                                },
                                items: <String>['Editor', 'Assistant Editor', 'Supporting Technician','Junior Editor','Other'].map<DropdownMenuItem<String>>((String value) {
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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                               DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: promotiondropdown3,
                                onChanged: (String? newValue) async {
                                  setState(() {
                                    promotiondropdown3 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('promotiondropdown3', newValue!);
                                },
                                items: <String>['Brand Promotions', 'Shows & Events', 'Maganizes','E-commerence'].map<DropdownMenuItem<String>>((String value) {
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
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: promotionname3Controller,
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

                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: promotionyear3Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Year',
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

                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select Role',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: promotionrole3,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    promotionrole3 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('promotionrole3', newValue!);
                                },
                                items: <String>['Editor', 'Assistant Editor', 'Supporting Technician','Junior Editor','Other'].map<DropdownMenuItem<String>>((String value) {
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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                               DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: promotiondropdown4,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    promotiondropdown4 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('promotiondropdown4', newValue!);
                                },
                                items: <String>['Brand Promotions', 'Shows & Events', 'Maganizes','E-commerence'].map<DropdownMenuItem<String>>((String value) {
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
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: promotionname4Controller,
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

                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: promotionyear4Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Year',
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

                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select Role',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: promotionrole4,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    promotionrole4 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('promotionrole4', newValue!);
                                },
                                items: <String>['Editor', 'Assistant Editor', 'Supporting Technician','Junior Editor','Other'].map<DropdownMenuItem<String>>((String value) {
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
                                            await prefs.setString('promotionname1Controller', promotionname1Controller.text);
                                            await prefs.setString('promotionname2Controller', promotionname2Controller.text);
                                            await prefs.setString('promotionname3Controller', promotionname3Controller.text);
                                            await prefs.setString('promotionname4Controller', promotionname4Controller.text);

                                            await prefs.setString('promotionyear1Controller', promotionyear1Controller.text);
                                            await prefs.setString('promotionyear2Controller', promotionyear2Controller.text);
                                            await prefs.setString('promotionyear3Controller', promotionyear3Controller.text);
                                            await prefs.setString('promotionyear4Controller', promotionyear4Controller.text);

                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                            const Acheivements(),
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


