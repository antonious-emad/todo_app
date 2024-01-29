import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:third/models/task_model.dart';

import '../../../models/user_model.dart';

class FirebaseFunctions {

  static CollectionReference<TaskModel> getTasksCollection(){
    return    FirebaseFirestore.instance.collection("tasks").withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, options) {
        return task.toJson();
      },);
  }

  static Future<void> addTask(TaskModel taskModel) {
    var collection=getTasksCollection();
    var docRef=collection.doc();
    // var docRef=collection.doc().delete();
    // var docRef=collection.doc().update(data);
    taskModel.id=docRef.id;
    return docRef.set(taskModel);
  }

  static Future<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime){
     return getTasksCollection().where("tasktime",isEqualTo:DateUtils.dateOnly(dateTime).millisecondsSinceEpoch ).orderBy("tasktime",descending: true).get();
  }

  static Stream<QuerySnapshot<TaskModel>> getTasksStream(DateTime dateTime){
    return getTasksCollection().where("userId",isEqualTo: FirebaseAuth.instance.currentUser!.uid).where("tasktime",isEqualTo:DateUtils.dateOnly(dateTime).millisecondsSinceEpoch ).snapshots();
  }

  static void deleteTask(String id) {
    getTasksCollection().doc(id).delete();
  }

  static void updateTask(TaskModel task) {
    getTasksCollection().doc(task.id).update(task.toJson());
  }

  static void updateTaskTobeDone(TaskModel task) {
    getTasksCollection().doc(task.id).update(task.todone());
  }

static Future<void>createuser(String name,int age,String email,String password,Function onSucess,Function onError)async{
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if(credential.user?.uid != null){
      UserModel user= UserModel(id: credential.user!.uid, name: name, email: email, age: age)  ;
      addUserToFirestor(user).then((value) {
        credential.user!.sendEmailVerification();
      onSucess();}) ;}
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      onError(e.message);
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      onError(e.message);
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }}

static Future<void> Login(String email,String password,Function onSucess, Function onError )async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    if(credential.user?.uid !=null){
      // var user= await readUserFromFirestore(credential.user!.uid);
      // onSucess(user);
      if(credential.user!.emailVerified){onSucess();}
      else{onError("please veritify your email ");}
    }
  } on FirebaseAuthException catch (e) {
    onError("Wrong email or password ");
    // onError(e.code);
    // onError(e.message);
    // if (e.code == 'user-not-found') {onError(e.message);print('Wrong user Name or password');}
    // else if (e.code == 'wrong-password') {onError(e.message);print('Wrong user Name or password ');}
  }
  }


  static CollectionReference<UserModel> getUsersCollection(){
    return    FirebaseFirestore.instance.collection("users").withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, options) {
        return user.toJson();
      },);
  }

  static Future<void> addUserToFirestor(UserModel user){
    var usercollection= getUsersCollection();
    var docRef=usercollection.doc(user.id);
    return docRef.set(user);
  }

  static  Future<UserModel?> readUserFromFirestore(String id) async{
    DocumentSnapshot<UserModel> userdoc=await  getUsersCollection().doc(id).get();
    return userdoc.data();


  }

}