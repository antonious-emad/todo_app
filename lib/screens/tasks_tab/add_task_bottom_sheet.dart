import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:third/models/task_model.dart';
import 'package:third/shared/network/firebase/firebase_functions.dart';
import 'package:third/shared/styles/colors.dart';
class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}
class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var tasktitlecontroller=TextEditingController();

  var tasktimecontroller=TextEditingController();

  var taskdescripitiontroller=TextEditingController();

  DateTime selecteddate=DateTime.now();
  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.addnewtask,style: Theme.of(context).textTheme.labelSmall,textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            TextFormField(
              style: TextStyle(color: Theme.of(context).colorScheme.errorContainer),
              validator: (value) {if(value==null ||value.isEmpty ){return  AppLocalizations.of(context)!.enteryourtasktitle;}return null;},
              controller: tasktitlecontroller,
              decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enteryourtasktitle,
              hintStyle:Theme.of(context).textTheme.headlineMedium,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MainColors.bor)
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color:  Theme.of(context).colorScheme.errorContainer)
              ),
                errorStyle: TextStyle(color: Colors.red,),
            ),),
            SizedBox(height: 20,),
            TextFormField(
              
              style: TextStyle(color: Theme.of(context).colorScheme.errorContainer),
              validator: (value) {if(value==null ||value.isEmpty ){return  AppLocalizations.of(context)!.enteryourtaskdetails;}return null;},
              controller: taskdescripitiontroller,decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enteryourtaskdetails,
              hintStyle:Theme.of(context).textTheme.headlineMedium,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MainColors.bor)
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.errorContainer)
              ),
              errorStyle: TextStyle(color: Colors.red,),
            ),),
            SizedBox(height: 20,),
            Text(AppLocalizations.of(context)!.selecttime,style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 20,),
            InkWell(
                onTap:() { selectDate(context);},
                child: Text("${selecteddate.toString().substring(0,10)}",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,)),
            SizedBox(height: 20,),
            ElevatedButton(
                style:ElevatedButton.styleFrom(backgroundColor: MainColors.secondryLightColor) ,
            //     onPressed: (){
            //    if(formkey.currentState!.validate()){
            //      TaskModel task=TaskModel(tasktitle: tasktitlecontroller.text, taskdescription: taskdescripitiontroller.text, tasktime:DateUtils.dateOnly(selecteddate).millisecondsSinceEpoch);
            //      FirebaseFunctions.addTask(task).then((value) {Navigator.pop(context);});
            //    }
            // },
                onPressed: (){if(formkey.currentState!.validate()){
                    TaskModel task=TaskModel(userId: FirebaseAuth.instance.currentUser!.uid,tasktitle: tasktitlecontroller.text, taskdescription: taskdescripitiontroller.text, tasktime:DateUtils.dateOnly(selecteddate).millisecondsSinceEpoch);
                    FirebaseFunctions.addTask(task);
                    Navigator.pop(context);
                  }},
                child: Text(AppLocalizations.of(context)!.savetask,style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: MainColors.whited
            ))
            )
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
       DateTime? choosenDate = await showDatePicker(
      context: context,
      initialDate: selecteddate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (context, child) {return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              surface: MainColors.secondryLightColor,
              onSurface: Theme.of(context).colorScheme.onErrorContainer,
              primary: MainColors.secondryLightColor,
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor:Theme.of(context).colorScheme.onError,
          ),
          child: child!,
        );},
    );
    if(choosenDate==null) {return;}
    selecteddate=choosenDate;
    setState(() {});
  }













}