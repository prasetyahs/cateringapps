import 'package:djcateringapps/pages/index_page.dart';
import 'package:djcateringapps/pages/landingpage.dart';
import 'package:djcateringapps/pages/login_page.dart';
import 'package:djcateringapps/pages/register_page.dart';
import 'package:djcateringapps/provider/login_provider.dart';
import 'package:djcateringapps/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.red));
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.red,
          textTheme: GoogleFonts.solwayTextTheme(Theme.of(context).textTheme)
              .copyWith(bodyText1: GoogleFonts.roboto())),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/loginPage': (context) => ChangeNotifierProvider.value(
              value: LoginProvider(),
              child: LoginPage(),
            ),
        '/homePage': (context) => IndexPage(),
        '/registerPage': (context) => ChangeNotifierProvider.value(
            value: RegisterProvider(), child: RegisterPage()),
      },
    );
  }
}