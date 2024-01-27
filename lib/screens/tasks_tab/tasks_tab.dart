import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third/models/task_model.dart';
import 'package:third/screens/tasks_tab/task_item.dart';
import 'package:third/shared/network/firebase/firebase_functions.dart';
import 'package:third/shared/styles/colors.dart';
import '../../providers/provider.dart';
class TasksTab extends StatelessWidget {
  static const String routeName = "TasksTab";

  const TasksTab({super.key});

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
              padding: EdgeInsets.all(38),
              child: Text("To Do List",
                  style: Theme.of(context).textTheme.bodyLarge),
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
                  initialDate: DateTime.now().subtract(Duration(days: 365)),
                  // initialDate: selectedDate,
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  lastDate: DateTime.now().add(Duration(
                    days: 365,
                  )),
                  onDateSelected: (date) {},
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
        FutureBuilder(
          future: FirebaseFunctions.getTasks(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){return Center(child: CircularProgressIndicator());}
            if(snapshot.hasError){return Center(child: Text("Something Went wrong"));}
            List<TaskModel> tasks=snapshot.data?.docs.map((task) => task.data()).toList()??[];
            return Expanded(child: ListView.builder(itemBuilder: (context, index) => TaskItem(tasks[index]),itemCount: tasks.length,));
          },
        )
      ],
    );
  }
}