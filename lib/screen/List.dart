
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:oderapp/SanPham.dart';

class listOrder extends StatelessWidget {
   listOrder({Key? key}) : super(key: key);
  final listController = Get.put(ListController());

   @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Scaffold(
        appBar: AppBar(
          title: Text("ĐƠN HÀNG"),
        ),
        body: ListView.builder(
          itemCount: listController.sanPham.length,
            itemBuilder: (context, index)  {
              return CatalogCart(index: index);
            },

        ),
      ),
    );
  }
}
class CatalogCart extends StatelessWidget {
  final ListController spControllers= Get.find() ;
  final index;
 late String t;
  CatalogCart({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(spControllers.sanPham[index].status)
      {
        t="ĐANG GIAO HÀNG";
      }
    else
    {
      t="CHỜ XÁC NHẬN";
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text("Người nhận: ${spControllers.sanPham[index].name}"),
            Text("Địa chỉ:${spControllers.sanPham[index].adress}"),
            Text("Số điện thoại: ${spControllers.sanPham[index].phone}"),
            Text("${(spControllers.sanPham[index].monan)}"),
          Text("Tình trạng: "+t,style: TextStyle(color: Colors.red),),
        ],
      ),
    );
  }
}
