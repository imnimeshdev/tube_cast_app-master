import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
import 'Talent_Page/talent_page1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,

  ])
      .then((value) => runApp(const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return     MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primaryColor: Colors.black, // Set primary color to black

          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.black, // Set cursor color to black
          ),
        ),
        home:   const TalentPage1()
    );
  }
}


