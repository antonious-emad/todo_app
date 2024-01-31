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
              controller: namecontroller,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: agecontroller,
              decoration: const InputDecoration(labelText: 'age'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailcontroller,
              decoration: const InputDecoration(labelText: 'Email'),
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
              controller: passwordcontroller,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
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
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}