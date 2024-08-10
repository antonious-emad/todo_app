import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third/layout/home_layout.dart';
import 'package:third/providers/provider.dart';
import 'package:third/shared/network/firebase/firebase_functions.dart';

import '../../shared/styles/colors.dart';
class SignUpTab extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var agecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Name",
                        hintStyle:Theme.of(context).textTheme.headlineMedium,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MainColors.bor)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:  Theme.of(context).colorScheme.errorContainer)
                        ),
                        errorStyle: TextStyle(color: Colors.red,),
                      ),
              style: TextStyle(color: Theme.of(context).colorScheme.errorContainer),
              controller: namecontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              decoration:InputDecoration(
                        labelText: "age",
                        hintText: "age",
                        hintStyle:Theme.of(context).textTheme.headlineMedium,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MainColors.bor)
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:  Theme.of(context).colorScheme.errorContainer)
                        ),
                        errorStyle: TextStyle(color: Colors.red,),
                      ),
              style: TextStyle(color: Theme.of(context).colorScheme.errorContainer),
              keyboardType: TextInputType.number,
              controller: agecontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              decoration:InputDecoration(
                        labelText:"Email" ,
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
              style: TextStyle(color: Theme.of(context).colorScheme.errorContainer),
              keyboardType: TextInputType.emailAddress,
              controller: emailcontroller,
              validator: (value) {
                // final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+").hasMatch(value!);
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // if (!emailValid) {return "Please eneter valid email";}
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(color: Theme.of(context).colorScheme.errorContainer),
              controller: passwordcontroller,
              obscureText: true,
              decoration:InputDecoration(
                        labelText: "password",
                        hintText: "password",
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
                // RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                // if (!regex.hasMatch(value)) {return 'Enter valid password';}
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(MainColors.secondryLightColor)),

              onPressed: () {
                if (formKey.currentState!.validate()) {
                  FirebaseFunctions.createuser(namecontroller.text,int.parse(agecontroller.text),
                      emailcontroller.text, passwordcontroller.text, () {
                        provider.initUser();
                        Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);

                        // Navigator.pushNamedAndRemoveUntil(context, Login.routeName, (route) => false);
                  }, (errormessage) {
                    showDialog(
                      barrierDismissible: false,
                        context: context,
                        builder:(context) => AlertDialog(
                          title: Text("Error"),
                          content: Text(errormessage),
                          actions: [
                            ElevatedButton(
                                style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(MainColors.secondryLightColor)),
                                onPressed: () {Navigator.pop(context);}, child: Text("Okay"))
                          ],
                        ));
                  });
                }
              },
              child: const Text('register',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}