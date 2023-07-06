import 'package:docmo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'pages/login_page.dart';
import 'pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {

  Color _primaryColor = HexColor('#2a6f97');
  Color _accentColor = HexColor('#014f86');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: _accentColor),
      ),
      home: SplashScreen(title: 'Doc-mo'),
    );
  }
}