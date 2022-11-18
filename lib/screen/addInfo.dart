
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oderapp/Controller.dart';
import 'package:oderapp/FireStoreDatabase.dart';
import 'package:oderapp/SanPham.dart';
import 'package:oderapp/screen/dialog.dart';

class addInfo extends StatelessWidget {
 final List<Oder> listss;
 late BuildContext listcontext;

   addInfo({Key? key,required this.listss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();
    TextEditingController txtTen= TextEditingController();
    TextEditingController txtPhone = TextEditingController();
    TextEditingController txtDC = TextEditingController();
    listcontext=context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Người đặt",style: TextStyle(
            color: Colors.black
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: txtTen,
              decoration: InputDecoration(
                  label: Text("Họ tên")
              ),
            ),
        TextField(
        controller: txtPhone,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            label: Text("Số điện thoại")
        ),),
        TextField(
        controller: txtDC,
        decoration: InputDecoration(
            label: Text("Địa chỉ")
        ),),
    SizedBox(height: 30,),
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Hủy")
          ),
          ElevatedButton(
              onPressed: () async {
                if(txtTen.text.trim()==''||
                txtPhone.text.trim()==''||
                txtDC.text.trim()=='')
                {
                  _showAlertDialog(context,"Chưa đủ thông tin người nhận");
                }
                else
                {
                  if(listss.isEmpty)
                    {
                      _showAlertDialog(listcontext,"Bạn chưa chọn đồ ăn nào ");
                    }
                  else
                  {
                    oder listoder = oder(
                        monan: listss,
                        name: txtTen.text,
                        phone: txtPhone.text,
                        adress: txtDC.text,
                        status: false
                    );
                    FireBases.addNew1(listoder);
                    FireBases.Addtocart(listoder);
                  showSnackBar(context, "Đặt món thành công", 2);
                    controller.clear();
                    Navigator.pop(context);
                  }
                }
              },

              child:Text("Đặt món"),

          ),

        ],
    )


          ],
        ),
      ),
    );
  }
 void _showAlertDialog(BuildContext context,String mess){

   AlertDialog alertDialog = AlertDialog(
     title: Text('Thông báo',style: TextStyle(color: Colors.blue),),
     content: Text(mess,style: TextStyle(color: Colors.red),),
     // backgroundColor: Color.fromARGB(500, 900, 200, 800),
     actions: [
       ElevatedButton(
           onPressed: () => Navigator.pop(context),
           child: Text('Ok'))
     ],
   );
   showDialog(
     context: context,
     builder:(context) => alertDialog,
   );
 }
}
