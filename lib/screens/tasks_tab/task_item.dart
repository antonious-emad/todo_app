import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:third/providers/provider.dart';
import 'package:third/shared/styles/colors.dart';
import '../../models/task_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskItem extends StatelessWidget {
  TaskModel? task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Theme.of(context).colorScheme.error,
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
                  color: task!.isdone
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
                    task!.tasktitle,
                    style: task!.isdone
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
                        "10:30 AM",
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
                width: 69,
                height: 34,
                decoration: BoxDecoration(
                  color: MainColors.secondryLightColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: task!.isdone
                    ? Text(AppLocalizations.of(context)!.done,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 22))
                    : Icon(
                        Icons.check_rounded,
                        size: 35,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
