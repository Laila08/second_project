import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:second_project/data/dbHelper.dart';
import 'package:second_project/data/dbProvider.dart';
import 'package:second_project/models/taskModel.dart';
import 'package:second_project/screens/homePage/firstScreen.dart';
import 'package:second_project/screens/homePage/home.dart';
import 'package:second_project/screens/homePage/percentIndicators.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return
      MultiProvider(providers:[
        ChangeNotifierProvider<DbProvider>(
          create: (context){return DbProvider();},),
              ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      home: FirstScreen(),
      theme: ThemeData(
        textTheme:GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    ),
    );
  }
}

