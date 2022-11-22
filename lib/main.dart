
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugasfirebase/Login.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBglOxZEH-0pyn9lXYqqSg7TA-mMkcCDnQ',
      appId: '1:668090261792:android:f760bfcb1b54a1a7217745',
      messagingSenderId: '668090261792',
      projectId: 'tsa-firebase-b9076'
    ));
    runApp(MyApp());
  
}
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}