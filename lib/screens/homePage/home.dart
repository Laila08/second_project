import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/constants/colors.dart';
import 'package:second_project/models/taskModel.dart';
import 'package:second_project/screens/homePage/percentIndicators.dart';
import 'package:second_project/screens/homePage/settingpage.dart';
import 'package:second_project/screens/widget/tasks.dart';
import 'package:second_project/data/data.dart';
class HomePage extends StatelessWidget{
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 25),
              child: Image.asset('assets/images/title.png',fit: BoxFit.cover,)),
          Container(
            margin: EdgeInsets.only(left: 120,bottom: 20),
            padding: EdgeInsets.all(5),
            child: Text('Category',style: GoogleFonts.caveat(fontSize: 40,fontWeight: FontWeight.bold,color: blue)),
          ),
          Expanded(child: Tasks()),
        ],
      ),
      bottomNavigationBar:Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                  color: blue.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10
              ),
            ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            showUnselectedLabels: false,
            selectedItemColor: blue,
            unselectedItemColor: blue,
            currentIndex: 1,
            items: [
              BottomNavigationBarItem(icon: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){return Percent_Indicators();}));
                  },
                  child: Icon(Icons.person,size: 30,)),label: 'Profile'),
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded,size: 30,color: blue,),label: 'Home'),
              BottomNavigationBarItem(icon: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){return SettingPage();}));
                  },
                  child: Icon(Icons.settings,size: 30,)),label: 'Setting'),
            ],
          ),
        ),
      ),
    );
  }
}

