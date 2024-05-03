import 'package:final_project/model/myUser.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier{
  MyUser? current;
  void updateUser(MyUser newUSer){
    current = newUSer;
    notifyListeners();
}
}