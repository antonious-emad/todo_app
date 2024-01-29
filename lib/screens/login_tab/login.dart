import 'package:flutter/material.dart';
import 'package:third/screens/login_tab/login_tab.dart';
import 'package:third/screens/login_tab/sign_up_tab.dart';
import 'package:third/shared/styles/colors.dart';

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
           Tab(icon: Icon(Icons.login),child:Text("Login") ,),
          Tab(icon: Icon(Icons.logout),child:Text("register") ,),
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
