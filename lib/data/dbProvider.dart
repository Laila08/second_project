import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:second_project/data/dbHelper.dart';
import 'package:second_project/models/taskModel.dart';

class DbProvider extends ChangeNotifier {
  DbProvider() {
    selectAllTasks();
    selectAllTasks2();
  }

  List<DescModel> TaskList = [];
  List<DescModel> TaskList2 = [];

  //------------------------------------------------------------1-----------------------------------------------
  fillLists(List<DescModel> tasks) {
    TaskList = tasks;
    notifyListeners();
  }

  addTaskToList(DescModel descModel) {
    TaskList.add(descModel);
    fillLists(TaskList);
  }

  createNewTask(DescModel descModel) async {
    await DbHelper.dbHelper.insertNewTask(descModel);
    addTaskToList(descModel);
    log(
        '************************************************************************************************');
  }

  selectAllTasks() async {
    List<DescModel> tasks = await DbHelper.dbHelper.selectAllTasks();
    fillLists(tasks);
  }

  deleteTask(DescModel descModel) async {
    await DbHelper.dbHelper.deleteOneTask(descModel.id!);
    notifyListeners();
    selectAllTasks();
    notifyListeners();
  }

  updateTask(DescModel descModel) async {
    await DbHelper.dbHelper.updateOneTask(descModel);
    notifyListeners();
    selectAllTasks();
  }
//------------------------------------------------------------1-----------------------------------------------
  fillLists2(List<DescModel> tasks) {
    TaskList2 = tasks;
    notifyListeners();
  }

  addTaskToList2(DescModel descModel) {
    TaskList2.add(descModel);
    fillLists(TaskList2);
  }

  createNewTask2(DescModel descModel) async {
    await DbHelper.dbHelper.insertNewTask2(descModel);
    addTaskToList2(descModel);
    log(
        '************************************************************************************************');
  }

  selectAllTasks2() async {
    List<DescModel> tasks = await DbHelper.dbHelper.selectAllTasks2();
    fillLists2(tasks);
  }

  deleteTask2(DescModel descModel) async {
    await DbHelper.dbHelper.deleteOneTask2(descModel.id!);
    //notifyListeners();
    selectAllTasks2();
    notifyListeners();
  }

  updateTask2(DescModel descModel) async {
    await DbHelper.dbHelper.updateOneTask2(descModel);
     selectAllTasks2();
    notifyListeners();

  }

}

