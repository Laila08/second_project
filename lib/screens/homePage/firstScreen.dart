import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:second_project/constants/colors.dart';
import 'package:second_project/models/taskModel.dart';
import 'package:second_project/screens/homePage/home.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading:  Lottie.asset('assets/animation/76195-completing-tasks (1).json'),
        title: Text('Task Management',style: GoogleFonts.caveat(color: blue,fontSize: 30)),
      ),
      body:Column(
          children: [
             Container(
                  child: Image.asset('assets/images/1_8ygFKYb0Yo6Hc-vnScGA9A.png',height: 400,)
              ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text('Manage and prioritize',style: GoogleFonts.caveat(
                      color: blue,fontSize: 30,fontWeight: FontWeight.bold),),
                  Text('your tasks easily',style: GoogleFonts.caveat(color: blue,fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text('Increase your productivity by manageing your personal and team task and do them based on the highest priority!',textAlign: TextAlign.center,style: GoogleFonts.caveat(color:blue,fontSize: 20),),
                  SizedBox(height: 50,),
                  TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){return HomePage();}));
                  }, child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: blue,
                        boxShadow: [
                          BoxShadow(
                              color: blue.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10
                          ),
                        ]

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Get Started ',style: GoogleFonts.caveat(color: Colors.white,fontSize: 25),),
                        Icon(Icons.arrow_forward,color: Colors.white,),
                      ],
                    ),
                  ))
                ],
              ),
            ),

          ],
        ),
    );
  }

}