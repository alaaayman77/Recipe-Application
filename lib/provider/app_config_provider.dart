import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
 ThemeMode appTheme = ThemeMode.dark;

 void changeTheme(ThemeMode newMode){
   if(appTheme == newMode){
     return ;
   }
   appTheme= newMode;
   notifyListeners();
 }
}