import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_users_app/firebase_options.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'global/global.dart';
import 'splashscreen/spash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(debugShowCheckedModeBanner: false,title:" Food Delivery" ,theme: ThemeData(primarySwatch: Colors.blue),
    // home: Scaffold(),
    // );
    return MaterialApp(
//title:  MaterialApp(
      title: 'Users App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MySplashScreen(),
    );
  }
}
