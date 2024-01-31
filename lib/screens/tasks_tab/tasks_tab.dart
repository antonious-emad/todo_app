import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third/models/task_model.dart';
import 'package:third/screens/tasks_tab/task_item.dart';
import 'package:third/shared/network/firebase/firebase_functions.dart';
import 'package:third/shared/styles/colors.dart';
import '../../providers/provider.dart';
import '../login/login.dart';
class TasksTab extends StatefulWidget {
  static const String routeName = "TasksTab";

  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}
class _TasksTabState extends State<TasksTab> {
  var selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          clipBehavior: Clip.none,
          // alignment: Alignment.bottomLeft,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("To Do List ${provider.userModel?.name} ",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Spacer(),
                  InkWell(onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(context, Login.routeName, (route) => false);
                  },child: Icon(Icons.logout)),
                  InkWell(onTap: () {
                    FirebaseAuth.instance.sendPasswordResetEmail(email: provider.userModel!.email );
                    Navigator.pushNamedAndRemoveUntil(context, Login.routeName, (route) => false);
                  },child: Icon(Icons.send)),

                ],
              ),
              height: MediaQuery.of(context).size.height * 0.18,
              width: double.infinity,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*0.05,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: CalendarTimeline(
                  // initialDate: DateTime.now().subtract(Duration(days: 365)),
                  initialDate: selectedDate,
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  lastDate: DateTime.now().add(Duration(
                    days: 365,
                  )),
                  onDateSelected: (date) {selectedDate=date;provider.changeselected(date);setState(() {});},
                  monthColor: MainColors.whited,
                  dayColor: provider.isDark ? MainColors.whited : Colors.black,
                  dayNameColor: Colors.blue.withOpacity(.5),
                  activeDayColor: Colors.blue.withOpacity(.5),
                  activeBackgroundDayColor: Theme.of(context).colorScheme.error,
                  leftMargin: 20,
                  dotsColor: Colors.transparent,
                  selectableDayPredicate: (date) => true,
                  locale: provider.languageCode,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        StreamBuilder(
          stream: FirebaseFunctions.getTasksStream(selectedDate),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){return Center(child: CircularProgressIndicator());}
            if(snapshot.hasError){return Center(child: Text("Something Went wrong"));}
            List<TaskModel> tasks=snapshot.data?.docs.map((task) => task.data()).toList()??[];
            if(tasks.isEmpty){return Center(child: Text("No Tasks")); }
            return Expanded(child: ListView.builder(itemBuilder: (context, index) => TaskItem(tasks[index]),itemCount: tasks.length,));
          },
        )

        // FutureBuilder(
        //   future: FirebaseFunctions.getTasks(selectedDate),
        //   builder: (context, snapshot) {
        //     if(snapshot.connectionState==ConnectionState.waiting){return Center(child: CircularProgressIndicator());}
        //     if(snapshot.hasError){return Center(child: Text("Something Went wrong"));}
        //     List<TaskModel> tasks=snapshot.data?.docs.map((task) => task.data()).toList()??[];
        //     return Expanded(child: ListView.builder(itemBuilder: (context, index) => TaskItem(tasks[index]),itemCount: tasks.length,));
        //   },
        // )
      ],
    );
  }
}