import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_application/screens/homeScreen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    ); // MaterialApp
  }
}
