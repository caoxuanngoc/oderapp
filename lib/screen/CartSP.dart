
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oderapp/Controller.dart';
import 'package:oderapp/SanPham.dart';

class CartSP extends StatelessWidget {

  final CartController controller = Get.find();

  CartSP({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

     return Obx(
       () =>
           SizedBox(height: 500, child:
           ListView.builder(
               itemCount: controller.sanpham.length,
               itemBuilder: (BuildContext context, int index) {
                 return
                   CartSPThe(
                     controller: controller,
                     sanPham: controller.sanpham.keys.toList()[index],
                     tong: controller.sanpham.values.toList()[index],
                     index: index,
                   );
               }

           ),
           ),
     );
   }
 }
  class CartSPThe extends StatelessWidget {

  final CartController controller;
  final SanPham sanPham;
  final int tong;
  final int index;
  // late List<Oder> list;
  TextEditingController txtTen= TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtDC = TextEditingController();
     CartSPThe({Key? key,required this.controller,required this.sanPham,
       required this.tong,required this.index}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      // Oder oder= new Oder(sanPham.name!, sanPham.price!, tong);
      // list.add(oder);
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            children: [
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       CircleAvatar(radius: 40,
                         backgroundImage: NetworkImage(
                          sanPham.urlImage!,
                 )
      ,),
                      SizedBox(width: 20,),
                      Expanded(child: Text(sanPham.name!)),
                      IconButton(
                          onPressed: (){
                           controller.remove(sanPham);
                          },
                          icon: Icon(Icons.remove_circle)),

                          Text("$tong"),

                      IconButton(
                          onPressed: (){
                            controller.addSanPham(sanPham);
                          },
                          icon: Icon(Icons.add_circle)),

              ]

      ),
            ],
          )
      );
    }
  }
