
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oderapp/Controller.dart';
import 'package:oderapp/FireStoreDatabase.dart';
import 'package:oderapp/SanPham.dart';
import 'package:oderapp/screen/addInfo.dart';
import 'package:oderapp/screen/dialog.dart';

class CartTong extends StatelessWidget {
  final CartController controller = Get.find();

    CartTong({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

     return
        Container( width: 300, height: 50,
          child: ElevatedButton(
            onPressed: (){

                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) =>
                            addInfo(listss: controller.list)));
            },
              // onPressed: () async{
              //   String? confrim = await showComfrimDialog(context,
              //       "Ban muon dat hang ko");
              //   if(confrim=="ok")
              //   {
              //
              //     oder neww=  oder(monan: controller.list);
              //     FireBases.addNew1(neww);
              //     // int i=0;
              //     // while(i<controller.listlen)
              //     // {
              //     //   FireBases.Addtocart(controller.list[i]);
              //     //   i++;
              //     // }
              //     controller.clear();
              //   }
              // },
              child:
                 Obx(()=>
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Xác nhận",style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold
                         ),
                         ),
                         SizedBox(width: 30,),
                         Text("${controller.tong}",style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold
                         ),
                         ),
                       ],
                    ),
                )
          ),
        );
      // )
    // ,
     //);

   }
   }


