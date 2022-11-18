
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oderapp/screen/DangKy.dart';
import 'package:oderapp/screen/dialog.dart';
import 'package:oderapp/screen/oder.dart';

class DangNhap extends StatefulWidget {


  const DangNhap({Key? key}) : super(key: key);

  @override
  State<DangNhap> createState() => _DangNhapState();
}

class _DangNhapState extends State<DangNhap> {

  TextEditingController txtEmail= TextEditingController();
  TextEditingController txtPass= TextEditingController();
  String? error;

  String? loi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng nhập"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: txtEmail,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                          borderSide: new BorderSide()),
                      labelText: "Email")),
              //SizedBox(height: 50,),
              SizedBox(height: 10,),
              TextField(
                  controller: txtPass,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                          borderSide: new BorderSide()),
                      labelText: "Password")
              )
              ,
              SizedBox(height: 10,),
              ElevatedButton(
                  style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.greenAccent),

                  ),

                  onPressed: () {
                    if(txtEmail.text!="" && txtPass.text!="")
                    {
                      loi="";
                      showSnackBar(context, "Đăng nhập....", 5);
                      signWihtEmailPass(email: txtEmail.text, password: txtPass.text).
                      then((value) {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context)=> OderScreen()
                        ),
                                (Route<dynamic> route) => false);

                        showSnackBar(context, "${FirebaseAuth.instance.currentUser?.email?? ""}", 2);
                      }).catchError((oerror){
                        setState(() {
                          this.loi=oerror;
                        });
                        showSnackBar(context, "Đăng nhập không thành công", 1);
                      });
                    }
                  },
                  child: Container(
                    width: 80,
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20,),
                        Text("Email"),
                      ],
                    ),
                  )),

              ElevatedButton(
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),

                ),
                child: Container(
                  width: 90,
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.g_translate),
                      SizedBox(width: 20,),
                      Text("Google"),


               ]
                  )
              ),

                onPressed: () async{
                  showSnackBar(context,  "Đang đằng nhập", 10);
                  var user = await signWtihGoogle();
                  if(user!= null)
                    {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                          builder: (context)=> OderScreen()
                      ),
                              (Route<dynamic> route) => false);

                      showSnackBar(context, "${FirebaseAuth.instance.currentUser?.email?? ""}", 2);
                    }else
                      {
                        setState(() {
                          loi="Đăng nhập thất bại";

                        });
                        showSnackBar(context, "Đăng nhập hoàn thành", 1);
                      }

                },),

              SizedBox(height: 10,),
              InkWell(
                hoverColor: Colors.blue,
                child: Text("Đăng ký"),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>RegisterScreen()));
                },
              ),

            ],
          ),
        ),
      ),
    );


  }
}
validateString(String? value) {
  return value == null || value.isEmpty ? "Chưa nhập thông tin": null ;
}

Future<UserCredential> signWtihGoogle() async{

  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  final credential= GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
  );
  return FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential> registerEmailPassword ({required String email, required String password})

{
  try{
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException catch(e)
  {
    return Future.error(e.code);
  }
}

Future<UserCredential> signWihtEmailPass({required String email, required String password})
async
{
  try{
    var userrCredentail = await FirebaseAuth.instance.
    signInWithEmailAndPassword(email: email, password: password);
    return userrCredentail;
  }on FirebaseAuthException catch(e)
  {
    return Future.error(e.code);
  }
}

