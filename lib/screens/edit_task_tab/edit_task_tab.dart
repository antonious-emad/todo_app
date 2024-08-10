import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third/layout/home_layout.dart';
import 'package:third/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/task_model.dart';
import '../../shared/network/firebase/firebase_functions.dart';
class EditTaskScreen extends StatefulWidget {
  static const String routeName="EditTask";
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}
final GlobalKey<FormState> formkey = GlobalKey<FormState>();
final TextEditingController tasktitlecontroller = TextEditingController();
final TextEditingController taskdescripitiontroller = TextEditingController();
DateTime selecteddate=DateTime.now();
bool choose = false;
var dateData;

class _TelaCadastroState extends State<EditTaskScreen> {
  @override
  Widget build(BuildContext context) {
    var taskaia=ModalRoute.of(context)?.settings.arguments as TaskModel;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onError,
        body: Stack(
          clipBehavior: Clip.none, children: <Widget>[
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.22,
            child: Container(
              padding: EdgeInsets.only(left: 17),
              color: MainColors.secondryLightColor,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text('To Do List', style: Theme.of(context).textTheme.bodyLarge,),
                ),
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width *0.90,
            left: 15,
            top: MediaQuery.of(context).size.height*0.17,
            child: Container(
              padding: EdgeInsets.all(25),
              height: MediaQuery.of(context).size.height*0.75,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(AppLocalizations.of(context)!.edittask,style: Theme.of(context).textTheme.labelSmall,textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    TextFormField(
                      validator: (value) {if(value==null ||value.isEmpty ){return  AppLocalizations.of(context)!.enteryourtasktitle;}return null;},
                      controller: tasktitlecontroller,
                      style: TextStyle(color: Theme.of(context).colorScheme.errorContainer),
                      decoration: InputDecoration(
                        hintText: taskaia.tasktitle,
                        hintStyle:Theme.of(context).textTheme.headlineMedium,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MainColors.bor)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:  Theme.of(context).colorScheme.errorContainer)
                        ),
                        errorStyle: TextStyle(color: Colors.red,),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      style: TextStyle(color: Theme.of(context).colorScheme.errorContainer),
                      validator: (value) {if(value==null ||value.isEmpty ){return  AppLocalizations.of(context)!.enteryourtasktitle;}return null;},
                      controller: taskdescripitiontroller,
                      decoration: InputDecoration(
                        hintText: taskaia.taskdescription,
                        hintStyle:Theme.of(context).textTheme.headlineMedium,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MainColors.bor)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.errorContainer)
                        ),
                        errorStyle: TextStyle(color: Colors.red,),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(AppLocalizations.of(context)!.selecttime,style: Theme.of(context).textTheme.headlineMedium,),
                    SizedBox(height: 20,),
                    InkWell(
                        onTap:() { selectDate(context);},
                        child: Text("${selecteddate.toString().substring(0,10)}",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,)),
                    SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                    ElevatedButton(
                        style:ElevatedButton.styleFrom(padding: EdgeInsets.all(12),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),backgroundColor: MainColors.secondryLightColor) ,
                        onPressed: (){
                          if(formkey.currentState!.validate()){
                            TaskModel task=TaskModel(id:taskaia.id,userId: FirebaseAuth.instance.currentUser!.uid,tasktitle: tasktitlecontroller.text, taskdescription: taskdescripitiontroller.text,
                                tasktime:DateUtils.dateOnly(selecteddate).millisecondsSinceEpoch);
                            FirebaseFunctions.updateTask(task);
                           Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.savetask,style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: MainColors.whited
                        ))
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        ));
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