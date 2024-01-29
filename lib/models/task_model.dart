class TaskModel {
  String id;
  String tasktitle;
  String taskdescription;
  int tasktime;
  bool isdone;
  String userId;

  TaskModel(
      {
        this.id="",
      required this.tasktitle,
      required this.taskdescription,
      required this.tasktime,
        required this.userId,
      this.isdone=false,

      }
      );

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
      tasktitle: json['tasktitle'],
      taskdescription: json['taskdescription'],
      tasktime: json['tasktime'],
      id: json['id'],
      userId: json['userId'],
      isdone: json['isdone']);

   Map<String, dynamic> toJson() {
    return {
      "tasktitle": tasktitle,
      "id": id,
      "userId":userId,
      "isdone": isdone,
      "taskdescription": taskdescription,
      "tasktime": tasktime,
    };
  }
  Map<String, dynamic> todone() {
    return {
      "tasktitle": tasktitle,
      "id": id,
      "userId":userId,
      "isdone": true,
      "taskdescription": taskdescription,
      "tasktime": tasktime,

    };
  }
}