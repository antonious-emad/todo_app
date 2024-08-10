import 'package:flutter/material.dart';
import 'package:third/screens/login/sign_up_tab.dart';
import 'package:third/shared/styles/colors.dart';

import 'login_tab/login_tab.dart';

class Login extends StatelessWidget {
  const Login({super.key});
static const String routeName="Login";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(backgroundColor:MainColors.secondryLightColor ,title: Text("Login",style: Theme.of(context).textTheme.bodyLarge,),bottom: TabBar(tabs: [
           Tab(icon: Icon(Icons.login,color: Colors.white),child:Text("Login",style: TextStyle(color: Colors.white),) ,),
          Tab(icon: Icon(Icons.logout,color: Colors.white,),child:Text("register",style: TextStyle(color: Colors.white),) ,),
        ]),),
        body: TabBarView(
          children: [
            LoginTab(),
            SignUpTab(),
          ],
        ),

      ),
    ));
  }
}
