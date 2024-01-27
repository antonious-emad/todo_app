import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:third/models/task_model.dart';

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

  static Future<QuerySnapshot<TaskModel>> getTasks(){
     return getTasksCollection().get();
  }


}