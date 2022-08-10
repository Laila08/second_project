import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/constants/colors.dart';
import 'package:second_project/data/data.dart';
import 'package:second_project/models/taskModel.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:second_project/screens/details/choresPage.dart';
import 'package:second_project/screens/details/detail.dart';
import 'package:second_project/screens/homePage/settingpage.dart';

class Tasks extends StatelessWidget{
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                buildTask(title: 'Personal',myIcon: Icons.person_rounded,iconColor: green1,pageColor: greenSet,context: context,page:TaskInfo(),widthNum: 180,heightNum: 150),
                SizedBox(width: 10,),
                buildTask(title: 'Chores',myIcon: Icons.auto_awesome_motion_rounded,iconColor: violit4,pageColor: violitSet,context: context,page:TaskInfo2(),widthNum: 180,heightNum: 150 ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                buildTask(title: 'Health',myIcon: Icons.favorite,iconColor: blue3,pageColor: blueSet,context: context,page:SettingPage(),widthNum: 180 ,heightNum: 150),
                SizedBox(width: 10,),
                buildTask(title: 'Errands',myIcon: Icons.task,iconColor: pink1,pageColor: pinkSet,context: context,page:SettingPage(),widthNum: 180,heightNum: 150 ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                buildTask(title: 'Miscellaneous',myIcon: Icons.difference,iconColor: newColor3,pageColor: newColorSet,context: context,page:SettingPage(),widthNum: 180 ,heightNum: 150),
                SizedBox(width: 10,),
                buildTask(title: 'Works',myIcon: Icons.work,iconColor: orange1,pageColor: orangeSet,context: context,page:SettingPage(),widthNum: 180,heightNum: 150 ),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

}
Widget buildTask({required BuildContext context,required Widget page,required List<Color> pageColor,required IconData myIcon,required Color iconColor,required String title,required double widthNum,required double heightNum }){
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){return page;}));
    },
    child: Container(
      width: widthNum,
      height: heightNum,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors:pageColor,
        ),
       // color:taskModel.bgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
              child: Icon(myIcon,color: iconColor,size: 30,)),
          SizedBox(height: 5,),
          Text(title,style: GoogleFonts.caveat(fontSize: 27,fontWeight: FontWeight.bold,color:blue)),
          //SizedBox(height: 20,),

        ],
      ),
    ),
  );
}
