
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oderapp/SanPham.dart';
import 'package:oderapp/screen/addInfo.dart';

class UserSC extends StatelessWidget {
   UserSC({Key? key}) : super(key: key);

   final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {

    return Obx(
        ()=>Scaffold(
        appBar: AppBar(
          title: Text("Thong tin nguoi dung"),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    // Navigator.push(context,
                    //     MaterialPageRoute(
                    //         builder: (context) => addInfo()));
                  },
                  icon: Icon(Icons.account_circle_outlined))
            ],
        ),
        body: ListView.builder(
                  itemCount: userController.user.length,
                    itemBuilder: (context, index) {
                     return CatalogCart(index:index);
                    },
                )
        )
    );

  }
}
class CatalogCart extends StatelessWidget {
  final UserController spControllers= Get.find() ;
  final int index;

  CatalogCart({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 20,),
          Expanded(
              child:
              Text(spControllers.user[index].name!,
              ),
          ),


        ],
      ),
    );
  }
}

