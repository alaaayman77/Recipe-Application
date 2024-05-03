import 'package:flutter/services.dart';

class MyUser {
  String? id;
  String? userName;
  String? email;
  String? image;
  MyUser({required this.id,required this.email, required this.userName,this.image});


  Map<String,dynamic> toFireStore(){
    return{
      'id':id,
      'name':userName,
      'email':email,
      'image':image
    };
  }

  MyUser.fromFireStore(Map<String,dynamic>?data):this(
      id: data?['id'],
      userName: data?['name'],
      email: data?['email'],
      image:data?['image']
  );

}