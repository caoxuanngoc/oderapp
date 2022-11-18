
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oderapp/SanPham.dart';

class CartController extends GetxController{
  final _sanpham= {}.obs;
 var  _i=0.obs;
  late List<Oder> _list =[];
 late Oder _oder1;
 void clear()
 {
      _i=0.obs;
     _list.clear();
     _sanpham.clear();

 }
  void addSanPham(SanPham sanPham){

    if(_sanpham.containsKey(sanPham))
      {
        _sanpham[sanPham]+=1;
      }
    else{
      Get.snackbar("Thành công",
          "Thêm ${sanPham.name}"
          ,snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 1),
      );
      _sanpham[sanPham]=1;
    }
    _oder1 = Oder(
        name: sanPham.name,
        price: sanPham.price,
        soluong: _sanpham[sanPham]
    );

    int i=0;
    while(i < _list.length) {

      if (_list.elementAt(i).name==_oder1.name) {
       // print("Xoa ne");
        _list.removeAt(i);
      }
      i++;
    }
   // print("Them ne");
    _list.add(_oder1);
    _i++;
  }

get i =>_i;
 get list=>_list;
  get listlen=>_list.length;

  void remove(SanPham sanPham){
    if(_sanpham.containsKey(sanPham) && _sanpham[sanPham]==1)
      {
        _sanpham.removeWhere((key, value) => key==sanPham);
      }
    else
      {
        _sanpham[sanPham]-=1;
      }
    _oder1 = Oder(

        name: sanPham.name,
        price: sanPham.price,
        soluong: _sanpham[sanPham]
    );

    int i=0;
    while(i < _list.length) {

      if (_list.elementAt(i).name==_oder1.name) {
      //  print("Xoa ne");
        _list.removeAt(i);
      }
      i++;
    }
   // print("Them ne");
    _list.add(_oder1);
    _i--;
  }
   get sanpham=> _sanpham;

  get sanphamSubtotal =>_sanpham.entries.
  map((sanpham) =>sanpham.key.price * sanpham.value).
  toList();
    get tong =>
    {
      if(!_sanpham.isEmpty)

        _sanpham.entries.
        map((sanpham) => sanpham.key.price * sanpham.value).
        toList().reduce((value, element) => value + element).toStringAsFixed(2)

    };
}