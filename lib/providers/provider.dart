import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:third/models/user_model.dart';
import 'package:third/shared/network/firebase/firebase_functions.dart';

class MyProider extends ChangeNotifier{
   String languageCode="en";
   bool isDark=false;
   int index=0;
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
    notifyListeners();
  }
  ChangeMode(flag){
    isDark=flag;
    notifyListeners();
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