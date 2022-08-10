import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:second_project/constants/colors.dart';
import 'package:second_project/models/taskModel.dart';
import 'package:second_project/screens/homePage/home.dart';
import 'package:second_project/screens/homePage/percentIndicators.dart';
import 'package:url_launcher/url_launcher.dart';


class SettingPage extends StatelessWidget {
  sendMessageByWhatsapp(String phone,String message){
    String url = "whatsapp://send?=$phone&text=${Uri.encodeFull(message)}";
    launchUrl(Uri.parse(url));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsetsDirectional.only(start: 30),
                child: Icon(Icons.arrow_back_ios,color: blue,size: 30,))),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Lottie.asset('assets/animation/lf20_fv0ohax4.json',height: 120,width: 120),
                Text('Settings',style: GoogleFonts.caveat(
                  color: blue,
                  fontSize: 40, fontWeight: FontWeight.bold
                )),
              ],
            ),
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              width: double.infinity,
              //height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: settingColor.withOpacity(0.3),
              ),
              child: GestureDetector(
                  onTap: (){
                    sendMessageByWhatsapp('972599436111','hello laila');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.share,color: bluecolor,),
                      SizedBox(width: 20,),
                      Text('Share App',style: GoogleFonts.caveat(fontSize: 20,color:bluecolor,fontWeight: FontWeight.bold),),
                      //Spacer(),
                      SizedBox(width: 164,),
                     Icon(Icons.arrow_forward_ios,color: bluecolor,)
                    ],
                  )),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              width: double.infinity,
              //height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: settingColor.withOpacity(0.3),
              ),
              child: GestureDetector(
                  onTap: (){
                    sendMessageByWhatsapp('972599436111','hello laila');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.rate_review_outlined,color: bluecolor,),
                      SizedBox(width: 20,),
                      Text('Rate App',style: GoogleFonts.caveat(fontSize: 20,color:bluecolor,fontWeight: FontWeight.bold),),
                      SizedBox(width: 175,),
                      Icon(Icons.arrow_forward_ios,color: bluecolor,)
                    ],
                  )),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              width: double.infinity,
              //height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: settingColor.withOpacity(0.3),
              ),
              child: GestureDetector(
                  onTap: (){
                    sendMessageByWhatsapp('972599436111','hello laila');

                  },
                  child: Row(
                    children: [
                      Icon(Icons.whatsapp,color: bluecolor,),
                      SizedBox(width: 20,),
                      Text('Contact us',style: GoogleFonts.caveat(fontSize: 20,color:bluecolor,fontWeight: FontWeight.bold),),
                      SizedBox(width: 166,),
                      Icon(Icons.arrow_forward_ios,color: bluecolor,)
                    ],
                  )),
            ),

          ],
        ),
      ),
    );
  }
}

