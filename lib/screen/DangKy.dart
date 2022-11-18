//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _repassword = TextEditingController();

  User m = User();

  String error = "";

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Đăng ký")),
        body: Center(
          child:  Container(
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    key: ValueKey('email'),
                    controller: _email,
                    // validator:  (value)  => validateEmail(value!),
                    onSaved: (newValue) => m.emai = newValue,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            borderSide: new BorderSide()),
                        labelText: "Email"
                    ),
                  ),
                  SizedBox(width: 20, height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    key: ValueKey('password'),
                    controller: _password,
                    // validator: (value) => validateString(value!),
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            borderSide: new BorderSide()),
                        labelText: "Password"
                    ),
                  ),
                  SizedBox(width: 20, height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    key: ValueKey('repassword'),
                    controller: _repassword,
                    // validator: (value) => validateRepassword(value),
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            borderSide: new BorderSide()),
                        labelText: "Retype Password"
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      child: Text("Register"),
                      onPressed: (){
                        bool?validate=_formkey.currentState?.validate();
                        if(validate == true){
                          error="";
                          showSnackBar(context,"Đang đăng ký ....",5);
                          registerEmailPassword(password:_password.text,email:_email.text)
                              .then((value){
                            setState((){
                              error="Đăng ký thành công";
                            });
                            showSnackBar(context,"Đăng ký thành công",3);
                          }).catchError((error){
                            setState((){

                            });
                            showSnackBar(context,"Đăng ký thất bại",3);
                          });
                        };
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  //   validateEmail(String value) async {
  //    return value == null || value.isEmpty || value.contains('@') ? "Email is not correct" : null;
  //  }
  //
  // validateString(String value) async {
  //    return value == null || value.isEmpty ? "Username is not empty": null;
  //  }
  //
  //   validatePassword(String value) {
  //    return value == null || value.isEmpty || value.length < 6 ? "Pass is not correct": null;
  //  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(BuildContext context, String s, int i) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(s),
      ),
    );
  }

  Future<UserCredential>registerEmailPassword({required String email,
    required String password}) async {
    try{
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    }on FirebaseAuthException catch(e){
      return Future.error(e.code);
    }
  }
}



// import 'package:flutter/material.dart';
// import 'package:oderapp/screen/Login.dart';
// import 'package:oderapp/screen/dialog.dart';
//
// class DangKy extends StatefulWidget {
//   const DangKy({Key? key}) : super(key: key);
//
//   @override
//   State<DangKy> createState() => _DangKyState();
// }
//
// class _DangKyState extends State<DangKy> {
//
//   final _formState = GlobalKey<FormState>();
//   User _user= User();
//   TextEditingController txtEmail= TextEditingController();
//   TextEditingController txtPass= TextEditingController();
//   String? error;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dang ky tai khoan"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Center(
//
//           child: Form(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             child: Column(
//
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   controller: txtEmail,
//                   onSaved: (newValue) => _user.user = newValue,
//                   validator: (value)=>validateString(value),
//                   decoration: InputDecoration(
//                       label: Text("Email")
//                   ),
//                 ),
//
//                 TextFormField(
//                   controller: txtPass,
//                   onSaved: (newValue) => _user.pass = newValue,
//                   validator: (value)=>validateString(value),
//                   decoration: InputDecoration(
//                       label: Text("Pass")
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: ()
//                   {
//                     bool? validate= _formState.currentState?.validate();
//                     if(validate==true)
//                     {
//                       error="";
//                       showSnackBar(context, "Dang dang ky...", 100);
//                       registerEmailPassword(email: txtEmail.text, password: txtPass.text).
//                       then((value) {
//                         setState(() {
//                           error="Dang ky thanh cong";
//                         });
//                         showSnackBar(context, "Dang ky thanh cong", 3);
//                       }).catchError((error){
//                         setState(() {
//                           this.error=error;
//                         });
//                         showSnackBar(context, "Dang ky ko thanh cong", 3);
//                       });
//                     }
//                     else
//                       {
//                         showSnackBar(context, "Bi gi r ", 3);
//                       }
//                   },
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Icon(Icons.key_sharp),
//                       Text("Dang ky"),
//
//
//                     ],
//                   ),
//
//                 ),
//
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class User {
  String? emai, pass;

  User({this.emai, this.pass});
 }
// validateString(String? value) {
//   return value == null || value.isEmpty ? " Ban chua nhap cai gi ca": null ;
// }
//   // class DangKy extends StatelessWidget {
//   //    DangKy({Key? key}) : super(key: key);
//   //
//   //   GlobalKey<FormState> _formState = GlobalKey<FormState>();
//   //   TextEditingController txtEmail= TextEditingController();
//   //   TextEditingController txtPass= TextEditingController();
//   //   String? error;
//   //
//   //   @override
//   //   Widget build(BuildContext context) {
//   //     return Scaffold(
//   //       appBar: AppBar(
//   //         title: Text("Dang ky tai khoan"),
//   //       ),
//   //       body: Padding(
//   //         padding: const EdgeInsets.all(20),
//   //         child: Center(
//   //
//   //           child: Column(
//   //             mainAxisAlignment: MainAxisAlignment.center,
//   //             children: [
//   //               TextFormField(
//   //                 controller: txtEmail,
//   //                 decoration: InputDecoration(
//   //                   label: Text("Email")
//   //                 ),
//   //               ),
//   //
//   //               TextFormField(
//   //                 controller: txtPass,
//   //                 decoration: InputDecoration(
//   //                     label: Text("Pass")
//   //                 ),
//   //               ),
//   //               ElevatedButton(
//   //                 onPressed: ()
//   //               {
//   //                 bool? validate= _formState.currentState?.validate();
//   //                 if(validate==true)
//   //                 {
//   //                   error="";
//   //                   showSnackBar(context, "Dang dang ky...", 100);
//   //                   registerEmailPassword(email: txtEmail.text, password: txtPass.text).
//   //                   then((value) {
//   //                     setState(() {
//   //                       error="Dang ky thanh cong";
//   //                     });
//   //                     showSnackBar(context, "Dang ky thanh cong", 3);
//   //                   }).catchError((error){
//   //                     setState(() {
//   //                       this.error=error;
//   //                     });
//   //                     showSnackBar(context, "Dang ky ko thanh cong", 3);
//   //                   });
//   //                 }
//   //               },
//   //                  child: Row(
//   //                    children: [
//   //                      Icon(Icons.key_sharp),
//   //                      Text("Dang ky"),
//   //
//   //
//   //                    ],
//   //                  ),
//   //
//   //               ),
//   //
//   //
//   //             ],
//   //           ),
//   //         ),
//   //       ),
//   //     );
//   //   }
//
//  // void setState(Null Function() param0) {}
//
//  // }
//

