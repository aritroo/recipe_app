import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/screens/categoryScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 131, 57, 0),
          // brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: CategoryScreen(),
    );
  }
}
