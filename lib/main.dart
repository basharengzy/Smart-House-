import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smarthouse/splashscreen.dart';

import 'mainhomepage.dart';
import 'mainpage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
  );
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({super.key});
   var crnuser=FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Basel App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:crnuser==null?splashscreen():mainHomePage(),
        debugShowCheckedModeBanner: false,
        //splashscreen(),Home(),mainHomePage()
        ///crnuser==null?splashscreen():mainHomePage(),
    );
  }
}