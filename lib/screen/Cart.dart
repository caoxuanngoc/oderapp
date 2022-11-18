
import 'package:flutter/material.dart';
import 'package:oderapp/screen/CartSP.dart';
import 'package:oderapp/screen/CartTong.dart';

class CartScreen extends StatelessWidget {

    CartScreen({Key? key}) : super(key: key);
   @override
   Widget build(BuildContext context) {
     return Scaffold(

       appBar: AppBar(
         backgroundColor: Colors.orange,
         title: Text("Giỏ hàng",style: TextStyle(
           color: Colors.black
         ),),
       ),
       body:
          Column(
           children: [
              CartSP(),

             CartTong(),
           ],
         ),
     );
   }
 }


