import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:third/screens/login/login_tab/connector.dart';

class LoginViewModel extends ChangeNotifier {

  late LoginConnector loginConnector;

   Future<void> Login(String email,String password,Function onSucess, Function onError )async{
    try {
      loginConnector.showLoading();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(credential.user?.uid !=null){
        // var user= await readUserFromFirestore(credential.user!.uid);
        // onSucess(user);
        await credential.user!.sendEmailVerification();
        if(credential.user!.emailVerified){
          loginConnector.hideLoading() ;
          loginConnector.goToHome();
          // onSucess();
        }
        else{
          loginConnector.hideLoading();
          loginConnector.showMessage("Wrong email or password ");
          // onError("please veritify your email ");
        }
      }
    } on FirebaseAuthException catch (e) {
      loginConnector.hideLoading();
      loginConnector.showMessage(e.message!);
      // onError("Wrong email or password ");
      // onError(e.code);
      // onError(e.message);
      // if (e.code == 'user-not-found') {onError(e.message);print('Wrong user Name or password');}
      // else if (e.code == 'wrong-password') {onError(e.message);print('Wrong user Name or password ');}
    }
  }


}
