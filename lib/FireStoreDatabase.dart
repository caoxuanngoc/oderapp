   import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oderapp/SanPham.dart';

  class FireBases{

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

   Stream<List<SanPham>> getAllSanPham()
   {
     return _firebaseFirestore.collection("Sanphams").snapshots().
     map((snapshot) {
       return snapshot.docs.map((doc) =>
           SanPham.fromSnapShot(doc)).toList();
     }
     );

   }
  Stream<List<oder>> getAll()
  {
    return _firebaseFirestore.collection("DatHang").snapshots().
    map((snapshot) {
      return snapshot.docs.map((doc) =>
          oder.formSnapShot(doc)).toList();
    }
    );

  }

  // Stream<List<oder>> getAllList()
  // {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   var currentUser = _auth.currentUser;
  //   CollectionReference _collectionReference= FirebaseFirestore.instance.collection("user-cart");
  //   return _collectionReference.doc("Dathang1").collection(currentUser!.email.toString()).snapshots().
  //   map((snapshot) {
  //     return snapshot.docs.map((doc) =>
  //         oder.formSnapShot(doc)).toList();
  //   }
  //   );

 // }
  Stream<List<Users>> getAllUser()
  {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionReference= FirebaseFirestore.instance.collection("User");
    return _collectionReference.doc("Thongtin").collection(currentUser!.email.toString()).snapshots().
    map((snapshot) {
      return snapshot.docs.map((doc) =>
          Users.fromSnapShot(doc)).toList();
    }
    );

  }

  static Future AddInfo(Users user) async{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionReference= FirebaseFirestore.instance.collection("User");
    return _collectionReference.doc("Thongtin").collection(currentUser!.email.toString()).add(user.toJson());
  }

  static Future Addtocart(oder sp) async{

     final FirebaseAuth _auth = FirebaseAuth.instance;
     var currentUser = _auth.currentUser;
     CollectionReference _collectionReference= FirebaseFirestore.instance.collection("user-cart");
     return _collectionReference.doc("Dathang1").collection(currentUser!.email.toString()).add(sp.todocment());
}
  static Future<DocumentReference> addNew1(oder sp) async
  {
    return FirebaseFirestore.instance.collection("DatHang").add(sp.todocment());
  }

 static Future<DocumentReference> addNew(Oder sp) async
 {
   return FirebaseFirestore.instance.collection("DatHang").add(sp.toJson());
 }
   }

   // class SanPhamSnapshot {
   //   SanPham? sanPham;
   //   DocumentReference? docRF;
   //   //
   //   // SanPhamSnapshot()
   //   // {}
   //    SanPhamSnapshot({required this.sanPham, required this.docRF});
   //
   //   factory SanPhamSnapshot.fromSnapshot(DocumentSnapshot docSnap){
   //     return SanPhamSnapshot(
   //       sanPham: SanPham.fromJson(docSnap.data() as Map<String, dynamic>),
   //       docRF: docSnap.reference,
   //     );
   //   }
   //
   //   static Future<DocumentReference> addNew(SanPham sv) async
   //   {
   //     return FirebaseFirestore.instance.collection("Sanphams").add(sv.toJson());
   //   }
   //
   //   static Stream<List<SanPhamSnapshot>> getAllSanPham() {
   //     Stream<QuerySnapshot> qs = FirebaseFirestore.instance.collection("Sanphams").snapshots();
   //     Stream<List<DocumentSnapshot>> listSnap = qs.map((qssnap) => qssnap.docs );
   //     return listSnap.map((lds) =>
   //         lds.map((docSnap) => SanPhamSnapshot.fromSnapshot(docSnap)
   //         ).toList());
   //   }
   // }