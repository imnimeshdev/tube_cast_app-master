import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
 import 'package:tube_cast_app/Work%20Experience/work_experience2.dart';



class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  final _formkey = GlobalKey<FormState>();
  final tvchannelname1Controller = TextEditingController();
  final tvchannelname2Controller = TextEditingController();
  final tvchannelname3Controller = TextEditingController();
  final tvchannelname4Controller = TextEditingController();

  final tvshowname1Controller = TextEditingController();
  final tvshowname2Controller = TextEditingController();
  final tvshowname3Controller = TextEditingController();
  final tvshowname4Controller = TextEditingController();




  String? tvdropdown1;
  String? tvdropdown2;
  String? tvdropdown3;
  String? tvdropdown4;
  String? tvrole1;
  String? tvrole2;
  String? tvrole3;
  String? tvrole4;

  @override
  void initState() {
    super.initState();
    loadPageData();
    _loadSelectedOption();
  }

  void loadPageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tvchannelname1Controller.text = prefs.getString('tvchannel1') ?? '';
      tvchannelname2Controller.text = prefs.getString('tvchannel2') ?? '';
      tvchannelname3Controller.text = prefs.getString('tvchannel3') ?? '';
      tvchannelname4Controller.text = prefs.getString('tvchannel4') ?? '';

      tvshowname1Controller.text = prefs.getString('tvname1') ?? '';
      tvshowname2Controller.text = prefs.getString('tvname2') ?? '';
      tvshowname3Controller.text = prefs.getString('tvname3') ?? '';
      tvshowname4Controller.text = prefs.getString('tvname4') ?? '';



    });
  }

  void _loadSelectedOption() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tvdropdown1 = prefs.getString('tvdropdown1') ?? null;
      tvdropdown2 = prefs.getString('tvdropdown2') ?? null;
      tvdropdown3 = prefs.getString('tvdropdown3') ?? null;
      tvdropdown4 = prefs.getString('tvdropdown4') ?? null;

      tvrole1 = prefs.getString('tvrole1') ?? null;
      tvrole2 = prefs.getString('tvrole2') ?? null;
      tvrole3 = prefs.getString('tvrole3') ?? null;
      tvrole4 = prefs.getString('tvrole4') ?? null;


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
                                "TV / Web Series/ Reality show",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: tvdropdown1,
                                onChanged: (String? newValue)async {
                                  setState(() {
                                    tvdropdown1 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('tvdropdown1', newValue!);
                                },



                                items: <String>['TV', 'Web Series', 'Reality Show',].map<DropdownMenuItem<String>>((String value) {
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
                                controller: tvchannelname1Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Channel / OTT Name ',
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
                                controller: tvshowname1Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Name of the Show / Serial',
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

                                value: tvrole1,
                                onChanged: (String? newValue) async {
                                  setState(() {
                                    tvrole1 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('tvrole1', newValue!);
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
                              // 2nd one
                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: tvdropdown2,
                                onChanged: (String? newValue) async {
                                  setState(()   {
                                    tvdropdown2 = newValue!;

                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('tvdropdown2', newValue!);
                                },
                                items: <String>['TV', 'Web Series', 'Reality Show',].map<DropdownMenuItem<String>>((String value) {
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
                                controller: tvchannelname2Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Channel / OTT Name ',
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
                                controller: tvshowname2Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Name of the Show / Serial',
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

                                value: tvrole2,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    tvrole2 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('tvrole2', newValue!);
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
                              // 3rd one
                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: tvdropdown3,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    tvdropdown3 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('tvdropdown3', newValue!);
                                },
                                items: <String>['TV', 'Web Series', 'Reality Show',].map<DropdownMenuItem<String>>((String value) {
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
                                controller: tvchannelname3Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Channel / OTT Name ',
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
                                controller: tvshowname3Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Name of the Show / Serial',
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

                                value: tvrole3,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    tvrole3 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('tvrole3', newValue!);
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
                              // 4th one
                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: tvdropdown4,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    tvdropdown4 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('tvdropdown4', newValue!);
                                },
                                items: <String>['TV', 'Web Series', 'Reality Show',].map<DropdownMenuItem<String>>((String value) {
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
                                controller: tvchannelname4Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Channel / OTT Name ',
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
                                controller: tvshowname4Controller,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                                  isDense: true,
                                  hintText: 'Name of the Show / Serial',
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

                                value: tvrole4,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    tvrole4 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('tvrole4', newValue!);

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
                                            await prefs.setString('tvchannel1', tvchannelname1Controller.text);
                                            await prefs.setString('tvchannel2', tvchannelname2Controller.text);
                                            await prefs.setString('tvchannel3', tvchannelname3Controller.text);
                                            await prefs.setString('tvchannel4', tvchannelname4Controller.text);

                                            await prefs.setString('tvname1', tvshowname1Controller.text);
                                            await prefs.setString('tvname2', tvshowname2Controller.text);
                                            await prefs.setString('tvname3', tvshowname3Controller.text);
                                            await prefs.setString('tvname4', tvshowname4Controller.text);


                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                            const WorkExperience2(),
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


