import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:third/models/user_model.dart';
import 'package:third/shared/network/firebase/firebase_functions.dart';

class MyProider extends ChangeNotifier{
   String languageCode="en";
   bool isDark=false;
   int index=0;
   SharedPreferences? preferences;
   ThemeMode mode = ThemeMode.light;
   // UserModel user=UserModel(id: "", name: "", email: "", age: 10) ;
   UserModel? userModel ;
   User? firbaseUser;
   MyProider(){
     firbaseUser = FirebaseAuth.instance.currentUser;
     if(firbaseUser != null){initUser();}

   }
   var selected=DateTime.now();
  ChangeLanguage(String langcode){
    languageCode=langcode;
    saveLanguage(langcode);
    notifyListeners();
  }

   Future<void> saveLanguage(String lang) async {
     String language = lang == 'en' ? 'en' : 'ar';
     await preferences!.setString('language', language);
   }

   Future<void> cashLanguage() async {
     preferences = await SharedPreferences.getInstance();
     String? oldLanguage = getLanguage();
     if (oldLanguage != null) {
       languageCode = oldLanguage == 'en' ? 'en' : 'ar';
     }
   }

   String? getLanguage() {
     return preferences!.getString('language');
   }







  ChangeMode(flag,ThemeMode themeMode){
    isDark=flag;
    mode=themeMode;
    saveTheme(mode);
    notifyListeners();
  }

   Future<void> saveTheme(ThemeMode themeMode) async {
     String theme = themeMode == ThemeMode.dark ? 'dark' : 'light';
     await preferences!.setString('theme', theme);
   }

   Future<void> cashTheme() async {
     preferences = await SharedPreferences.getInstance();
     String? oldTheme = displayTheme();
     if (oldTheme != null) {
       mode = oldTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
       isDark=oldTheme=='dark'?true:false;
     }
   }

   String? displayTheme() {
     return preferences!.getString('theme');
   }








  changeindex(value){
    index=value;
    notifyListeners();
  }
  changeselected(selectedDate){
    selected=selectedDate;
    notifyListeners();
  }

  // setUser(UserModel userModel){ user =userModel;notifyListeners();}

void initUser() async{
    firbaseUser=FirebaseAuth.instance.currentUser;
    userModel =await FirebaseFunctions.readUserFromFirestore(firbaseUser!.uid);
    notifyListeners();
}

}