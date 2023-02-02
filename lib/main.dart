import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/Intro_page.dart';

void main() {
  runApp(const MyAppWidget());
}
class MyAppWidget extends StatelessWidget {
  const MyAppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: GoogleFonts.varelaRoundTextTheme(
          Theme.of(context).textTheme
        )
      ),
      debugShowCheckedModeBanner: false,
      title: 'Numeros',
      home: IntroPage(),
    );
  }
}