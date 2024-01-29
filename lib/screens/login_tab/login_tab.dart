import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third/providers/provider.dart';
import 'package:third/shared/network/firebase/firebase_functions.dart';
import 'package:third/shared/styles/colors.dart';
import '../../layout/home_layout.dart';
class LoginTab extends StatelessWidget {
var formKey=GlobalKey<FormState>();
var emailcontroller=TextEditingController();
var passwordcontroller=TextEditingController();
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
              controller: emailcontroller,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
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
                FirebaseFunctions.Login(emailcontroller.text, passwordcontroller.text,
                        (){
                  provider.initUser();
                  Navigator.pushNamedAndRemoveUntil(
                            // arguments:user,
                            context, HomeLayout.routeName, (route) => false);},
                        (errorMessage){showDialog(context: context, builder:(context) => AlertDialog(title: Text("Error"),content: Text(errorMessage),actions: [ElevatedButton(onPressed:(){}, child:Text("okay"))],), );}
                );
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