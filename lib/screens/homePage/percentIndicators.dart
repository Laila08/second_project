import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:second_project/constants/colors.dart';
import 'package:second_project/data/data.dart';
import 'package:second_project/data/dbProvider.dart';
import 'package:second_project/models/taskModel.dart';
import 'package:second_project/screens/homePage/home.dart';
import 'package:second_project/screens/homePage/settingpage.dart';

class Percent_Indicators extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    const RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0)));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title:  Text('Percent Indicators',style :GoogleFonts.caveat(
              fontSize: 30
          )),
          shape: roundedRectangleBorder,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight:  Radius.circular(15),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      bluecolor,blue,
                    ])
            ),
          ),
        ),
      body:SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            _CircularPercentIndicatorWidget('Personal ',greenSet,Provider.of<DbProvider>(context).TaskList.length),
                            Spacer(),
                            _CircularPercentIndicatorWidget('Chores ',violitSet,50),
                          ],
                        ),
                        SizedBox(height: 70,),
                        Row(
                          children: [
                            _CircularPercentIndicatorWidget('Health ',blueSet,90),
                            Spacer(),
                            _CircularPercentIndicatorWidget('Errands ',pinkSet,30),
                          ],
                        ),
                        SizedBox(height: 70,),
                        Row(
                          children: [
                            _CircularPercentIndicatorWidget('Miscellaneous ',newColorSet,100),
                            Spacer(),
                            _CircularPercentIndicatorWidget('Works ',orangeSet,0),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(icon:Icon(Icons.person,size: 30,),label: 'Profile'),
              BottomNavigationBarItem(icon: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){return HomePage();}));
                  },
                  child: Icon(Icons.home_rounded,size: 30,)),label: 'Home'),
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
//CircularPercentIndicatorWidget(),
Widget _CircularPercentIndicatorWidget(String title,List<Color> colorList,int percentNum){
 return Column(
    children: [
      Text(title,style: GoogleFonts.caveat(
        fontSize: 25,
        color: bluecolor,
        fontWeight: FontWeight.bold
      ),),
      SizedBox(height: 10,),
      CircularPercentIndicator(
        radius: 70.0,
        lineWidth: 10.0,
        percent: percentNum/100,
        center: Text("$percentNum%",style: TextStyle(fontSize: 20,color: bluecolor ),),
        circularStrokeCap: CircularStrokeCap.round,
        backgroundColor: Colors.grey,
        maskFilter: MaskFilter.blur(BlurStyle.solid, 3),
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colorList,
        ),
      ),
    ],
  );
}
