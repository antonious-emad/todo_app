import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third/providers/provider.dart';
class EditTaskScreen extends StatelessWidget {
static const String routeName="EditTask";
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProider>(context);
    return SafeArea(
      child: Container(
        color: Theme.of(context).colorScheme.onError,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.none,
              // alignment: Alignment.bottomLeft,
              children: [
                Container(
                  padding: EdgeInsets.all(38),
                  child: Text("To Do List",style: Theme.of(context).textTheme.bodyLarge),
                  height: MediaQuery.of(context).size.height*0.18,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.85,
                    child: Card(
                      color:Theme.of(context).colorScheme.error,
                      // color:provider.isDark ?Colors.white:Color(0xff141922),
                      elevation: 10,
                      margin: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.transparent,width: 2),
                          borderRadius: BorderRadius.circular(15)
                      ),

                      child:Column(
                        children: [
                        ],
                      ),
                    ) ,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}