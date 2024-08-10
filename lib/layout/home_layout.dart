import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third/models/user_model.dart';
import 'package:third/providers/provider.dart';
import 'package:third/screens/tasks_tab/add_task_bottom_sheet.dart';
import 'package:third/screens/tasks_tab/tasks_tab.dart';
import '../screens/settings_tab/settings_tab.dart';
class HomeLayout extends StatelessWidget {
static const String routeName="layout";
List<Widget>tabs=[TasksTab(),SettingsTab()];
  @override
  Widget build(BuildContext context) {
    // var user=ModalRoute.of(context)?.settings.arguments as UserModel;
    var provider=Provider.of<MyProider>(context);
    // provider.setUser(user);
    return SafeArea(
        child: Scaffold(
          extendBody: false,
         body: tabs[provider.index],
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
         floatingActionButton:FloatingActionButton(
           elevation: 15,
             shape:  CircleBorder(side: BorderSide(color: Theme.of(context).colorScheme.error,width: 4)),
             child: Icon(Icons.add,color: Colors.white),
             onPressed: (){
             showModalBottomSheet(
               backgroundColor: Theme.of(context).colorScheme.error,
                isScrollControlled: true,
               context: context,
               builder: (context) {
                 return Padding(
                   padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                   child: AddTaskBottomSheet(),
                 );
               },);
         }),
         bottomNavigationBar: BottomAppBar(
           color: Theme.of(context).colorScheme.error,
           shape:const  CircularNotchedRectangle(),
           notchMargin: 8,
           child: BottomNavigationBar(
             type: BottomNavigationBarType.shifting,
             elevation: 0,
             onTap: (value) {
            provider.changeindex(value);
        },
             currentIndex: provider.index,
             items: [
            BottomNavigationBarItem(backgroundColor: Colors.transparent,label: "",icon: Icon(Icons.list,)),
            BottomNavigationBarItem(backgroundColor: Colors.transparent,label: "",icon: Icon(Icons.settings)),
        ],
      ),
         ),
    )
    );
  }
}