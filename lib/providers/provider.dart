import 'package:flutter/cupertino.dart';

class MyProider extends ChangeNotifier{
   String languageCode="en";
   bool isDark=false;
   int index=0;
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

}