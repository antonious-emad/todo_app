import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:third/providers/provider.dart';
import 'package:third/screens/edit_task_tab/edit_task_tab.dart';
import 'package:third/shared/styles/colors.dart';
import '../../models/task_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/network/firebase/firebase_functions.dart';
class TaskItem extends StatefulWidget {
  TaskModel? task;
  TaskItem(this.task);
  @override
  State<TaskItem> createState() => _TaskItemState();
}
class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  18.0,vertical: 8),
      child: Card(
        color: Theme.of(context).colorScheme.error,
        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14)
        ) ,
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.23,
            // A motion is a widget used to control how the pane animates.
            motion: const DrawerMotion(),
            // All actions are defined in the children parameter.
            children:  [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                borderRadius:BorderRadius.only(topLeft:Radius.circular(14),bottomLeft: Radius.circular(14) ) ,
                onPressed: (context) {
                  FirebaseFunctions.deleteTask(widget.task!.id);
                  },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          endActionPane: ActionPane(
              extentRatio: 0.23,
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  borderRadius:BorderRadius.only(topRight:Radius.circular(14),bottomRight: Radius.circular(14) ) ,
                  onPressed: (context) {
                    Navigator.pushNamed(context,EditTaskScreen.routeName,arguments: widget.task!);
                    // FirebaseFunctions.updateTask(widget.task!);
                  },
                  backgroundColor: MainColors.secondryLightColor,
                  // foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 4,
                    height: 62,
                    decoration: BoxDecoration(
                      color: widget.task!.isdone
                          ? MainColors.green
                          : MainColors.secondryLightColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task!.tasktitle,
                        style: widget.task!.isdone
                            ? Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: MainColors.green)
                            : Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: provider.isDark
                                ? MainColors.whited
                                : MainColors.blacked,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${DateFormat("yyyy/MM/dd").format(DateTime.fromMillisecondsSinceEpoch(widget.task!.tasktime))}",
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: provider.isDark
                                  ? MainColors.whited
                                  : MainColors.blacked,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                    width: 90,
                    height: 34,
                    decoration: BoxDecoration(
                      color:widget.task!.isdone? Colors.transparent :MainColors.secondryLightColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: widget.task!.isdone
                        ? Text(AppLocalizations.of(context)!.done,
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 22,color: MainColors.green))
                        : InkWell(
                          onTap: () {
                        widget.task!.isdone=true;
                        FirebaseFunctions.updateTaskTobeDone(widget.task!);
                        setState(() {});
                      },
                          child: Icon(
                              Icons.check_rounded,
                              size: 35,
                            ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
