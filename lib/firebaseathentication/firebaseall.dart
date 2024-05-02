import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseAll {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email,
      String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("some error ");
    }
    return null;
  }





  Future<User?> signIpWithEmailAndPassword(String email,
      String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("some error ");
    }
    return null;
  }
//   static CollectionReference<myUser> getUsersCollections() {
//     return
//       FirebaseFirestore.instance.collection(myUser.collectionName).
//       withConverter(
//           fromFirestore: (snapshot, options) => myUser.fromFireStore(snapshot.data()),
//           toFirestore: (user,options)=> user.toFireStore());
//   }
//
//   static Future<void> addUserToFirestore(myUser MyUser){
//     return getUsersCollections().doc(MyUser.id).set(MyUser);
//   }
//
//
//
// }
// class myUser{
//   String? id;
//   String? name;
//   String? email;
//
//   static String collectionName = 'users';
//   myUser({required this.id,required this.name,required this.email});
//
//   Map<String,dynamic> toFireStore(){
//     return{
//       'id':id,
//       'name':name,
//       'email':email,
//     };
//   }
//
//   myUser.fromFireStore(Map<String,dynamic>?data):this(
//       id: data?['id'],
//       name: data?['name'],
//       email: data?['email']
//
//);

}