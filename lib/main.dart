import 'package:djcateringapps/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.orange[300]));
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.solwayTextTheme(Theme.of(context).textTheme)
              .copyWith(bodyText1: GoogleFonts.roboto())),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        
      },
    );
  }
}
