import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  static late SharedPreferences prefs;
late ThemeMode appTheme = getChangeTheming()??ThemeMode.light;

 void changeTheme(ThemeMode newMode){
   if(appTheme == newMode){
     return ;
   }
   appTheme= newMode;
   setChangeTheming();
   notifyListeners();
 }
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }
  Future<void> setChangeTheming() async {
    if (appTheme == ThemeMode.light) {
      prefs.setBool('apptheme', true);
    } else {
      prefs.setBool('apptheme', false);
    }
  }
  getChangeTheming(){
    if (prefs.getBool('apptheme') == true) {
      return ThemeMode.light;
    } else if (prefs.getBool('apptheme') == false) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}