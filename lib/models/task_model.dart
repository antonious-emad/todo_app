class TaskModel {
  String id;
  String tasktitle;
  String taskdescription;
  int tasktime;
  bool isdone;

  TaskModel(
      {
        this.id="",
      required this.tasktitle,
      required this.taskdescription,
      required this.tasktime,
      this.isdone=false
      }
      );

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
      tasktitle: json['tasktitle'],
      taskdescription: json['taskdescription'],
      tasktime: json['tasktime'],
      id: json['id'],
      isdone: json['isdone']);

   Map<String, dynamic> toJson() {
    return {
      "tasktitle": tasktitle,
      "id": id,
      "isdone": isdone,
      "taskdescription": taskdescription,
      "tasktime": tasktime,
    };
  }

}
