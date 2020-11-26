import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signup.dart';
import 'welcome.dart';
import 'login.dart';
import 'airport.dart';
import 'setting.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: welcome(),
      routes:{
        'welcome': (context) => welcome(),
        'sign-up': (context) => signup(),
        'login'  : (context) =>login(),
        'airport': (context) => state(),
        'setting': (context)=> setting(),
      },
    );
  }
}



