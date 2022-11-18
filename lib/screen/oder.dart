import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oderapp/Controller.dart';
import 'package:oderapp/screen/Cart.dart';
import 'package:oderapp/screen/List.dart';
import 'package:oderapp/screen/Login.dart';
import 'package:oderapp/screen/SP.dart';
import 'package:oderapp/screen/UserScreen.dart';
import 'package:oderapp/screen/dialog.dart';

  class OderScreen extends StatelessWidget {

    late String i;
     OderScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      final  controller = Get.put(CartController());
      return Scaffold(
        appBar: AppBar(
            title: Text("CHỌN MÓN ĐI NÀO "),
            actions: [
              Badge(
                    position: BadgePosition.topEnd(top: 0, end: 5),
                    badgeContent: Obx(()=> Text("${controller.i}")),
                    child: IconButton(
                        onPressed: () => Get.to(()=>CartScreen()),
                        icon:Icon( Icons.shopping_cart_outlined)),
                  )


             // Badge(
             //      position: BadgePosition.topEnd(top: 0, end: 5),
             //      badgeContent: Text("1"),
             //      child: IconButton(
             //          onPressed: () => Get.to(()=>CartScreen()),
             //          icon:Icon( Icons.shopping_cart_outlined)),
             //    ),
           ],
          ),

        body: SafeArea(
          child: Column(
            children: [
              CatalogSP(),

            ],
          ),
          bottom: true,

        ),
        drawer: Drawer(

          backgroundColor: Colors.green,
          child: ListView(
            children: [
              DrawerHeader(
                  child: Column(
                    children: [
                      Icon(Icons.account_circle_outlined ,
                        size: 80,color:
                        Colors.amberAccent,),
                        Text("Xinh chào ${FirebaseAuth.instance.currentUser?.email?? ""}")
                    ],
                  ),
              ),
              ListTile(
                title: Text("Lịch sử"),
                onTap:() {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => UserSC()));
                }
              ),
              ListTile(
                title: Text("Admin"),
                onTap:(){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => listOrder()));
                } ,
              ),
              SizedBox(height: 250,),
              ElevatedButton(
                onPressed: (){
                  showSnackBar(context, "Đăng xuất...", 5);
                  FirebaseAuth.instance.signOut().whenComplete(() {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context)=>const DangNhap()),
                            (Route<dynamic>route) => false);
                    showSnackBar(context, "Đăng xuất thành công", 1);
                  }).catchError((error){
                    showSnackBar(context, "Đăng xuất không thành công", 1);
                  });

                },
                  child: Text("Logout"),
              )
            ],
          ),
        ),
      );
    }
  }
