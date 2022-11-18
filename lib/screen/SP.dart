
  import 'package:flutter/material.dart';
import 'package:oderapp/Controller.dart';
import 'package:oderapp/FireStoreDatabase.dart';
import 'package:oderapp/SanPham.dart';
import 'package:get/get.dart';

class CatalogSP extends StatelessWidget {

  final spController = Get.put(SPController());

     CatalogSP({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Obx(
          ()=> Flexible(child: ListView.builder(
          itemCount: spController.sanPham.length,
            itemBuilder: (BuildContext context,int index){
              return CatalogCart(index: index);
            }
        )),
      );
    }
  }

  class CatalogCart extends StatelessWidget {
  final cartController = Get.put(CartController());

  final SPController spControllers= Get.find() ;
  final int index;


   CatalogCart({Key? key,required this.index}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Padding(

            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(radius: 50, backgroundImage: NetworkImage(
                  spControllers.sanPham[index].urlImage!,
                )
                  ,),
                SizedBox(width: 20,),
                Expanded(
                    child:
                    Text(spControllers.sanPham[index].name!,
                      style: TextStyle(fontWeight:
                      FontWeight.bold,
                          fontSize: 20),)),

                Expanded(
                    child: Text('${spControllers.sanPham[index].price} vnđ')),
                IconButton(
                    onPressed: () {

                      cartController.addSanPham(spControllers.sanPham[index]);

                    },
                    icon: Icon(
                        Icons.add_circle
                    )
                )

              ],
            ),
          );
        }
    }


