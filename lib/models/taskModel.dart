import 'package:flutter/material.dart';
import 'package:second_project/data/dbHelper.dart';
// class TaskModel{
//   IconData? myicon;
//   String? title;
//   List<Color>? bgColor;
//   Color? iconColor;
//   Color? btnColor;
//   List<Map<String,dynamic>>? desc;
//   TaskModel({this.myicon,this.title,this.bgColor,this.iconColor,this.btnColor,this.desc});
// }
class DescModel{
  int? id;
  String? startTime;
  String? endTime;
  String? title;
  String? slot;
  // Color? tlColor;
  // List<Color>? pageColor;
  DescModel({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.slot,
  });
  DescModel.fromMap(Map<String, dynamic> map) {
    id = map[DbHelper.taskIdColumName];
    title = map[DbHelper.taskTitleColumName];
    startTime = map[DbHelper.taskStartTimeColumName];
    endTime = map[DbHelper.taskEndTimeColumName];
    slot = map[DbHelper.taskSlotColumName];

  }
  /////////////////////////////////////////////////////////////////////////////////
  Map<String, dynamic> toMap() {
    return {
      DbHelper.taskTitleColumName: title,
      DbHelper.taskStartTimeColumName: startTime,
      DbHelper.taskEndTimeColumName: endTime,
      DbHelper.taskSlotColumName: slot,
    };
  }

}
