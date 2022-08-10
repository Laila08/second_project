import 'dart:developer';
import 'package:second_project/models/taskModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:second_project/screens/widget/taskTimeLine.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper();
  DbHelper() {
    initDatabase();
  }

  static const String tableName = 'tasks';
  static const String tableName2 = 'tasks2';


  static const String taskIdColumName = 'id';
  static const String taskTitleColumName = 'title';
  static const String taskStartTimeColumName = 'startTime';
  static const String taskEndTimeColumName = 'endTime';
  static const String taskSlotColumName = 'slot';
  ////////////////////////////////////////////////////////////////

  Database? database;
  initDatabase() async {
    database = await createConnectionWithDatabase();
  }

  Future<Database> createConnectionWithDatabase() async {
    String databasePath = await getDatabasesPath();
    String databaseName = 'tasks.db';
    String fullPath = join(databasePath, databaseName);
    Database database =
    await openDatabase(fullPath, version: 1, onCreate: (db, i)async {
    await  db.execute('''
 CREATE TABLE $tableName(
    $taskIdColumName INTEGER PRIMARY KEY AUTOINCREMENT,
    $taskTitleColumName TEXT,
    $taskStartTimeColumName TEXT,
    $taskEndTimeColumName TEXT,
    $taskSlotColumName TEXT)
'''
      );
    await  db.execute('''
 CREATE TABLE $tableName2(
    $taskIdColumName INTEGER PRIMARY KEY AUTOINCREMENT,
    $taskTitleColumName TEXT,
    $taskStartTimeColumName TEXT,
    $taskEndTimeColumName TEXT,
    $taskSlotColumName TEXT)
'''
    );
    },);
    return database;
  }
  //--------------------------------------------1------------------------------------------------------------//
/////////////////////////////insert///////////////////////////////////////////////////
  insertNewTask(DescModel descModel) async {
    int rowIndex = await database!.insert(tableName, descModel.toMap());
    log('print new task in personal---------------------------');
  }

  /////////////////////////////select///////////////////////////////////////////////////

  Future<List<DescModel>> selectAllTasks() async {
    List<Map<String, Object?>> rowsAsMaps = await database!.query(tableName);
    List<DescModel> tasks =
    rowsAsMaps.map((e) => DescModel.fromMap(e)).toList();
    tasks.forEach((element){ print(element.id);});
    return tasks;
  }

/////////////////////////////update///////////////////////////////////////////////////
  updateOneTask(DescModel descModel) async {
    int count = await database!.update(tableName, descModel.toMap(),
        where: '$taskIdColumName=?', whereArgs: [descModel.id]);
  }

  /////////////////////////////delete///////////////////////////////////////////////////
  deleteOneTask(int id) {
    database!.delete(tableName, where: '$taskIdColumName=?', whereArgs: [id]);
  }
//--------------------------------------------2------------------------------------------------------------//
/////////////////////////////insert///////////////////////////////////////////////////
  insertNewTask2(DescModel descModel) async {
    int rowIndex = await database!.insert(tableName2, descModel.toMap());
    log('print new task in chores---------------------------');

  }

  /////////////////////////////select///////////////////////////////////////////////////

  Future<List<DescModel>> selectAllTasks2() async {
    List<Map<String, Object?>> rowsAsMaps = await database!.query(tableName2);
    List<DescModel> tasks =
    rowsAsMaps.map((e) => DescModel.fromMap(e)).toList();
    return tasks;
  }

/////////////////////////////update///////////////////////////////////////////////////
  updateOneTask2(DescModel descModel) async {
    int count = await database!.update(tableName2, descModel.toMap(),
        where: '$taskIdColumName=?', whereArgs: [descModel.id]);
  }

  /////////////////////////////delete///////////////////////////////////////////////////
  deleteOneTask2(int id) {
    database!.delete(tableName2, where: '$taskIdColumName=?', whereArgs: [id]);
  }
}
