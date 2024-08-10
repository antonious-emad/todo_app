import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third/base.dart';
import 'package:third/providers/provider.dart';
import 'package:third/screens/login/login_tab/connector.dart';
import 'package:third/screens/login/login_tab/login_view_model.dart';
import 'package:third/shared/network/firebase/firebase_functions.dart';
import 'package:third/shared/styles/colors.dart';
import '../../../layout/home_layout.dart';
class LoginTab extends StatefulWidget  {
  @override
  State<LoginTab> createState() => _LoginTabState();
}

// class _LoginTabState extends State<LoginTab> implements LoginConnector
class _LoginTabState extends BaseView<LoginViewModel,LoginTab> implements LoginConnector

{
  LoginViewModel loginViewModel=LoginViewModel();

var formKey=GlobalKey<FormState>();

var emailcontroller=TextEditingController();

var passwordcontroller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginViewModel.conncetor=this;
  }

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProider>(context);
    return ChangeNotifierProvider(
      create: (context) => loginViewModel,
      builder:(context, child) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                style: TextStyle(color: Theme.of(context).colorScheme.errorContainer),
                controller: emailcontroller,
                decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Email",
                        hintStyle:Theme.of(context).textTheme.headlineMedium,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MainColors.bor)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:  Theme.of(context).colorScheme.errorContainer)
                        ),
                        errorStyle: TextStyle(color: Colors.red,),
                      ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: TextStyle(color: Theme.of(context).colorScheme.errorContainer),
                controller: passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                        labelText:"Passord",
                        hintText: "Password",
                        hintStyle:Theme.of(context).textTheme.headlineMedium,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MainColors.bor)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:  Theme.of(context).colorScheme.errorContainer)
                        ),
                        errorStyle: TextStyle(color: Colors.red,),
                      ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(MainColors.secondryLightColor)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                  loginViewModel.Login(emailcontroller.text, passwordcontroller.text,
                          (){
                    provider.initUser();
                    Navigator.pushNamedAndRemoveUntil(
                              // arguments:user,
                              context, HomeLayout.routeName, (route) => false);},
                          (errorMessage){showDialog(context: context, builder:(context) => AlertDialog(title: Text("Error"),content: Text(errorMessage),actions: [ElevatedButton(onPressed:(){}, child:Text("okay"))],), );}
                  );
                  }
                },
                child: const Text('Login',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  goToHome() {
      Navigator.restorablePushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
  }

  @override
  hideLoading() {
        Navigator.pop(context);
  }

  @override
  showLoading() {
          showDialog(context: context,barrierDismissible: false,builder:(context) => AlertDialog(backgroundColor: Colors.transparent,title: Center(child: CircularProgressIndicator()),));
  }

  @override
  showMessage(String message) {
    showDialog(context: context,barrierDismissible: false,builder:(context) => AlertDialog(title: Text("Error"),content: Text(message),actions: [
      ElevatedButton(onPressed:() {Navigator.pop(context);} , child: Text("thanks"))
    ],));

  }

  @override
  LoginViewModel initMyViewModel() {
    return LoginViewModel();
  }
}