//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:oderapp/FireStoreDatabase.dart';
//
// class Firebasehome extends StatefulWidget {
//   const Firebasehome({Key? key}) : super(key: key);
//
//   @override
//   State<Firebasehome> createState() => _FirebasehomeState();
// }
//
// class _FirebasehomeState extends State<Firebasehome> {
//   BuildContext? dialogContext;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My home SinhVien"),
//         // actions: [
//         //   IconButton(
//         //       onPressed:
//         //           ()=> Navigator.push(
//         //         context,
//         //         MaterialPageRoute(
//         //             builder:(context)=>
//         //                 PageDetail(xem: false,)
//         //         ),),
//         //       icon: Icon(Icons.add_circle_outline))
//         // ],
//       ),
//       body: StreamBuilder<List<SanPhamSnapshot>>(
//         stream: SanPhamSnapshot.getAllSanPham(),
//         builder: (context,snapshot)
//         {
//           if(snapshot.hasError)
//
//           {
//             print("Co loi o day ne"+"${snapshot.error}");
//
//           return Center(
//             child: Text(" Co loi xay ra khi truy van du lieu"),
//           );}
//           else
//           if(!snapshot.hasData)
//             return Center(
//               child: Text("Dang tai du lieu"),
//             );
//           else
//             return ListView.separated(
//
//                 separatorBuilder: (context, index) => const Divider(thickness: 1,),
//
//                 itemCount:snapshot.data!.length ,
//
//                 itemBuilder: (context, index) {
//
//                   dialogContext = context;
//
//                   return  Slidable(
//
//                     child: ListTile(
//
//                       leading: Text("${snapshot.data![index].sanPham!.urlImage}"
//                         , style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),),
//                       title: Text("${snapshot.data![index].sanPham!.name}"),
//
//                       subtitle: Text(
//                           "${snapshot.data![index].sanPham!.price}"),
//                     ),
//
//                     // endActionPane: ActionPane(
//                     //   motion: ScrollMotion(),
//                     //   children: [
//                     //     SlidableAction(
//                     //       onPressed: (context) =>
//                     //           Navigator.push(
//                     //             context,
//                     //             MaterialPageRoute(
//                     //                 builder: (context) =>
//                     //                     PageDetail(xem: true,
//                     //                       sinhvienSnapshot: snapshot
//                     //                           .data![index],)
//                     //             ),),
//                     //       icon: Icons.details,
//                     //       foregroundColor: Colors.green,
//                     //     ),
//                     //     SlidableAction(
//                     //       onPressed: (context) =>
//                     //           Navigator.push(
//                     //             context,
//                     //             MaterialPageRoute(
//                     //                 builder: (context) =>
//                     //                     PageDetail(xem: false,
//                     //                       sinhvienSnapshot: snapshot
//                     //                           .data![index],)
//                     //             ),),
//                     //       icon: Icons.edit,
//                     //       foregroundColor: Colors.blue,
//                     //     ),
//                     //     SlidableAction(
//                     //       onPressed: (context) async {
//                     //         await snapshot.data![index].Xoa();
//                     //       },
//                     //       icon: Icons.delete_forever,
//                     //       foregroundColor: Colors.red,
//                     //     ),
//                     //
//                     //   ],
//                     // ),
//                   );
//                 }
//             );
//         },
//
//       ),
//     );
//   }
// // void _xoa(BuildContext context,SinhvienSnapshot svs)async{
// //   String? confirm;
// //   confirm=await showComfrimDialog(context, "Ban muon xoa sv ${svs!.sinhVien!.ten}");
// //   if(confirm=="OK")
// //     {
// //       FirebaseFirestore _storage = FirebaseFirestore.instance;
// //       Reference reference =_storage.ref().child("images").child("anh_${svs!.sinhVien!.id}.ipg");
// //       reference.delete();
// //       svs!.Xoa().whenComplete(() => showSnackBar(context,
// //           "Xoa du lieu thanh cong", 3
// //       )).onError((error, stackTrace) {
// //         showSnackBar(context, "Xoa du lieu khong thanh cong", 3);
// //         return Future.error("Xoa du lieu khong thanh cong");
// //       });
// //
// //     }
// // }
// }
