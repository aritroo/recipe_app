import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/screens/categoryScreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orentation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Color.fromRGBO(223, 255, 216, 1),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 131, 57, 0),

              // brightness: Brightness.dark,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: const Color.fromARGB(255, 244, 181, 202),
            ),
            textTheme: GoogleFonts.latoTextTheme(),
          ),
          home: CategoryScreen(),
        );
      },
    );
  }
}
