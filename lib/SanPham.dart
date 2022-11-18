
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:oderapp/FireStoreDatabase.dart';
import 'package:oderapp/screen/DangKy.dart';
class Users{
  String? name,phone,adress;

  Users({required this.name,required this.phone,required this.adress});

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "phone":phone,
      "adress":adress
    };
  }

  factory Users.fromSnapShot(DocumentSnapshot snapshot)
  {
    Users user=Users(
        name : snapshot['name'],
        phone : snapshot['phone'],
        adress : snapshot['adress']
    );
    return user;
  }
}
class oder {

  final List<dynamic> monan;


 final String? name;
 final String? phone;
 final String? adress;
 final bool? status;
  oder({
    required this.monan,
    required this.name,
    required this.phone,
    required this.adress,
    required this.status,
  });

  Map<String,Object> todocment(){
    return {
      'name':name!,
      'phone':phone!,
      'adress':adress!,
      'monan':monan.map((monans) => monans.toJson()).toList(),
      'status':status!
    };
  }


  factory oder.formSnapShot(DocumentSnapshot snap)
  {
    oder sp= oder(
        name: snap['name'],
        phone: snap['phone'],
        adress: snap['adress'],
        monan:List<dynamic>.from(snap['monan']).toList(),
        status: snap['status']
    );
    return sp;
  }


}
class Oder{

  String? name;
  int? price;
  int? soluong;


  Oder({required this.name,required this.price,required this.soluong});

  Map<String,dynamic> toJson(){
    return {
      "name": name,
      "price": price,
      "soluong": soluong,
    };
  }

  factory Oder.fromSnapShot(DocumentSnapshot snapshot)
  {
    Oder sanPham= Oder(
      name: snapshot['name'],
      price: snapshot['price'],
      soluong: snapshot['soluong'],
    );
    return sanPham;
  }


}
class SanPham{
     String? name;
    final int price;
     String? urlImage;

    SanPham( {required this.name,
      required  this.price,
     required  this.urlImage
    });

 factory SanPham.fromSnapShot(DocumentSnapshot snapshot)
{
  SanPham sanPham= SanPham(
      name: snapshot['name'],
      price: snapshot['price'],
      urlImage: snapshot['urlImage'],
  );
  return sanPham;
}

    // factory SanPham.fromJson(Map<String,dynamic> map)
    // {
    //   return  SanPham(
    //       name: map["name"],
    //       price: map["price"],
    //       urlImage: map["urlImage"]
    //   );
    // }

    // static List<SanPham> sanpham=[
    //   SanPham(
    //       name: "Xoai",
    //       price:15000,
    //       urlImage: "https://hongngochospital.vn/wp-content/uploads/2020/02/xoai-xanh.jpg"
    //   ),
    //   SanPham(
    //       name: "Oi",
    //       price:15000,
    //       urlImage: "https://hongngochospital.vn/wp-content/uploads/2020/02/xoai-xanh.jpg"
    //   ),
    //   SanPham(
    //       name: "Cam",
    //       price:15000,
    //       urlImage: "https://hongngochospital.vn/wp-content/uploads/2020/02/xoai-xanh.jpg"
    //   ),
    //   SanPham(
    //       name: "Quyt",
    //       price:15000,
    //       urlImage: "https://hongngochospital.vn/wp-content/uploads/2020/02/xoai-xanh.jpg"
    //   ),
    //
    // ];
}
  class UserController extends GetxController
  {
    final user=<Users>[].obs;

    @override
    void onInit()
    {
      user.bindStream(FireBases().getAllUser());
      super.onInit();
    }
  }
  class ListController extends GetxController
  {
    final sanPham=<dynamic>[].obs;

    @override
    void onInit()
    {
      sanPham.bindStream(FireBases().getAll());
      super.onInit();
    }
  }

class SPController extends GetxController
  {
    final sanPham=<SanPham>[].obs;

    @override
    void onInit()
    {
      sanPham.bindStream(FireBases().getAllSanPham());
      super.onInit();
    }
  }

