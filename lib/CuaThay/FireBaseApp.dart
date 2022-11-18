//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:oderapp/CuaThay/FireBaseHome.dart';
//
// class FirebaseApp extends StatefulWidget {
//   const FirebaseApp({Key? key}) : super(key: key);
//
//   @override
//   State<FirebaseApp> createState() => _FirebaseAppState();
// }
//
// class _FirebaseAppState extends State<FirebaseApp> {
//   bool ketnoi = false;
//   bool loi = false;
//
//   @override
//   Widget build(BuildContext context) {
//     if(loi){
//       return Container(
//         color: Colors.white,
//
//         child: Center(
//           child: Text("Loi roi ne",style: TextStyle(fontSize: 18),
//             textDirection: TextDirection.ltr,
//           ),
//
//         ),
//       );}
//     else if(!ketnoi)
//
//       return Container(
//         color: Colors.white,
//
//         child: Center(
//           child: Text("Dang ket noi",style: TextStyle(fontSize: 18),
//             textDirection: TextDirection.ltr,
//           ),
//
//         ),
//       );
//     else
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: "Ket noi fire page App",
//         home: Firebasehome(),
//       );
//
//   }
//   @override
//   void initState()
//   {
//     super.initState();
//     _khoitaoFirebase();
//   }
//   _khoitaoFirebase() async{
//     try{
//       WidgetsFlutterBinding.ensureInitialized();
//       await Firebase.initializeApp();
//       setState(() {
//         ketnoi =true;
//       });
//     }catch(e){
//       print(e);
//       setState(() {
//         loi=true;
//       });
//     }
//   }
// }