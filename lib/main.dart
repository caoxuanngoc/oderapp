
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oderapp/CuaThay/FireBaseApp.dart';
import 'package:oderapp/TestFB/Tesrr.dart';
import 'package:oderapp/screen/Login.dart';
import 'package:oderapp/screen/oder.dart';



void main() async
{
   WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();
  runApp(GetMaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: OderScreen(),
    );
  }
}

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.brown,
//       ),
//       debugShowCheckedModeBanner: false,
//       home:  TestKey(),
//     );
//   }
// }
