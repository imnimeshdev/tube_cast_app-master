import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
 import 'package:tube_cast_app/Work%20Experience/work_experience3.dart';



class WorkExperience2 extends StatefulWidget {
  const WorkExperience2({super.key});

  @override
  State<WorkExperience2> createState() => _WorkExperience2State();
}

class _WorkExperience2State extends State<WorkExperience2> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController moviename1Controller = TextEditingController();
  final TextEditingController moviename2Controller = TextEditingController();
  final TextEditingController moviename3Controller = TextEditingController();
  final TextEditingController moviename4Controller = TextEditingController();



  String? moviedropdown1;
  String? moviedropdown2;
  String? moviedropdown3;
  String? moviedropdown4;

  String? movierole1;
  String? movierole2;
  String? movierole3;
  String? movierole4;



  @override
  void initState() {
    super.initState();
    loadPageData();
    _loadSelectedOption();
  }

  void loadPageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      moviename1Controller.text = prefs.getString('moviename1Controller') ?? '';
      moviename2Controller.text = prefs.getString('moviename2Controller') ?? '';
      moviename3Controller.text = prefs.getString('moviename3Controller') ?? '';
      moviename4Controller.text = prefs.getString('moviename4Controller') ?? '';



    });
  }

  void _loadSelectedOption() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      moviedropdown1 = prefs.getString('moviedropdown1') ?? null;
      moviedropdown2 = prefs.getString('moviedropdown2') ?? null;
      moviedropdown3 = prefs.getString('moviedropdown3') ?? null;
      moviedropdown3 = prefs.getString('moviedropdown3') ?? null;

      movierole1 = prefs.getString('movierole1') ?? null;
      movierole2 = prefs.getString('movierole2') ?? null;
      movierole3 = prefs.getString('movierole3') ?? null;
      movierole4 = prefs.getString('movierole4') ?? null;


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
                                "Movies / Music Videos / Short films / TVC",
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

                                value: moviedropdown1,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    moviedropdown1 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('moviedropdown1', newValue!);
                                },
                                items: <String>['Movies', 'Music Videos', 'Short Films','TVC'].map<DropdownMenuItem<String>>((String value) {
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
                                controller: moviename1Controller,
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

                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select Role',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: movierole1,
                                onChanged: (String? newValue) async {
                                  setState(() {
                                    movierole1 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('movierole1', newValue!);
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

                                value: moviedropdown2,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    moviedropdown2 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('moviedropdown2', newValue!);
                                },
                                items: <String>['Movies', 'Music Videos', 'Short Films','TVC'].map<DropdownMenuItem<String>>((String value) {
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
                                controller: moviename2Controller,
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

                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select Role',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: movierole2,
                                onChanged: (String? newValue) async {
                                  setState(() {
                                    movierole2 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('movierole2', newValue!);
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
                              const SizedBox(
                                height: 10,
                              ),
                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: moviedropdown3,
                                onChanged: (String? newValue) async{
                                  setState(() {
                                    moviedropdown3 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('moviedropdown3', newValue!);
                                },
                                items: <String>['Movies', 'Music Videos', 'Short Films','TVC'].map<DropdownMenuItem<String>>((String value) {
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
                                controller: moviename3Controller,
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

                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select Role',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: movierole3,
                                onChanged: (String? newValue) async {
                                  setState(() {
                                    movierole3 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('movierole3', newValue!);
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

                                value: moviedropdown4,
                                onChanged: (String? newValue) async {
                                  setState(() {
                                    moviedropdown4 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('moviedropdown4', newValue!);
                                },
                                items: <String>['Movies', 'Music Videos', 'Short Films','TVC'].map<DropdownMenuItem<String>>((String value) {
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
                                controller: moviename4Controller,
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

                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                hint:  const Text('Select Role',
                                    style:   TextStyle(color: Colors.black)
                                ),

                                value: movierole4,
                                onChanged: (String? newValue) async {
                                  setState(() {
                                    movierole4 = newValue!;
                                  });
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('movierole4', newValue!);
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
                                            await prefs.setString('moviename1Controller', moviename1Controller.text);
                                            await prefs.setString('moviename2Controller', moviename2Controller.text);
                                            await prefs.setString('moviename3Controller', moviename3Controller.text);
                                            await prefs.setString('moviename4Controller', moviename4Controller.text);

                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                            const WorkExperience3(),
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


