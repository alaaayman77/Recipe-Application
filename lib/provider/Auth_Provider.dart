

import 'package:final_project/firebase_utils/FirebaseUtils.dart';
import 'package:final_project/model/myUser.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderAuth extends ChangeNotifier{
   static  late SharedPreferences prefs;
  MyUser? myUser;
 static late bool checkLogin= getAutoLogin();
  updateNewUser(MyUser? newUser)async{
    myUser=newUser;
    setAutoLogin();
    notifyListeners();
  }
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }
  setAutoLogin(){
    if(myUser!=null){
      prefs.setBool('account',true);
      prefs.setString('id',myUser!.id!);
      prefs.setString('name',myUser!.userName!);
      prefs.setString('email',myUser!.email!);
      // prefs.setStringList('image',myUser!.image! as DomStringList);
    }
    notifyListeners();
  }
   //  Future<void> updateUserProfile({required String uid,String name=''})async{
   //   var snapshot= await FirebaseUtils.getUserCollection().doc(uid).update(
   //       {"name":name}
   //   );
   //   notifyListeners();
   // }
  // getDataUser()async{
  //   var uId=prefs.getString('id')??"";
  //   var content=await FirebaseUtils.readUser(uId);
  //   prefs.setString('name',content['name']);
  //   prefs.setString('email',content['email']);
  //   notifyListeners();
  // }
 static getAutoLogin(){
    if(prefs.getBool('account')==true){
      return true;
    }else {
      return false;
    }
  }
}