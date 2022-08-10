import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:second_project/constants/colors.dart';
import 'package:second_project/data/data.dart';
import 'package:second_project/data/dbProvider.dart';
import 'package:second_project/models/taskModel.dart';
import 'package:second_project/screens/widget/textFormFieldWidget.dart';
import 'package:timeline_tile/timeline_tile.dart';

// class TaskTimeLine extends StatefulWidget{
//    DescModel descModel;
//   static const IconData delete = IconData(0xe1b9, fontFamily: 'MaterialIcons');
//   //final Map<String,dynamic> detail;
//   TaskTimeLine(this.descModel);
//
//   @override
//   State<TaskTimeLine> createState() => _TaskTimeLineState();
// }

class TaskTimeLine2 extends StatelessWidget{
  DescModel descModel;
  List<Color> pageColor;
  TaskTimeLine2(this.descModel,this.pageColor);
  TextEditingController controllerTaskNameup2 = TextEditingController();
  TextEditingController controllerTaskStartingTimeup2 = TextEditingController();
  TextEditingController controllerTaskEndingTimeup2 = TextEditingController();
  TextEditingController controllerTaskSlotup2 = TextEditingController();

  String? requiredValidator(String v) {
    if (v.length < 3) {
      return 'Task name must contain at least 3 letters';
    }
  }

  String? clockValidation(String v) {
    if (v.length > 2) {
      return 'invalid';
    }
  }
  String? slotValidation(String v) {
    if (v.length < 2) {
      return 'Time period must contain at least 2 letters';
    }
  }


  GlobalKey<FormState> editKey2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              height: 95,
              width: 20,
              child: TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0,
                isFirst: true,
                indicatorStyle: IndicatorStyle(
                    indicatorXY: 0,
                    width: 15,
                    indicator: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border:Border.all(width: 5,color:bluecolor, )
                      ),
                    )
                ),
                afterLineStyle: LineStyle(
                  thickness: 2,
                  color: bluecolor,
                ),
              ),
            ),
            Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(descModel.startTime!+' '+descModel.slot!,style: GoogleFonts.caveat(fontSize: 17,color: blue),),
                  //    ?
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors:pageColor,
                        ),
                        //Provider.of<DbProvider>(context).selectOneTasks(descModel)['bgColor'],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                    ),
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(descModel.title!,style:
                        GoogleFonts.caveat(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: blue
                        ),),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('${descModel.startTime}'+' '+'${descModel.slot}'+' - '+'${descModel.endTime}'+' '+'${descModel.slot}',style: GoogleFonts.caveat(
                                color:blue,
                                fontSize: 17
                            ),),
                            Spacer(),
                            InkWell(
                                onTap: (){
                                  showDialog(context: context, builder: (context){
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(40)
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(40),
                                            color: KBlueLight,
                                            border: Border.all(color: blue,width: 2)
                                        ),
                                        height:520 ,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          child: Form(
                                            key: editKey2,
                                            child: Column(
                                              children: [
                                                TextFormFieldWidget(title: 'New Task Name :',controller:controllerTaskNameup2,validator: requiredValidator,),
                                                SizedBox(height: 15,),
                                                TextFormFieldWidget(title: 'New Starting Time :',controller:controllerTaskStartingTimeup2,validator: slotValidation,),
                                                SizedBox(height: 15,),
                                                TextFormFieldWidget(title: 'New Ending Time :',controller:controllerTaskEndingTimeup2,validator: slotValidation,),
                                                SizedBox(height: 15,),
                                                TextFormFieldWidget(title: 'slot :',controller:controllerTaskSlotup2,validator: slotValidation,),
                                                SizedBox(height: 15,),
                                                Container(

                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(15),
                                                        color: blue
                                                    ),
                                                    child: IconButton(
                                                        onPressed: ()async{
                                                    if (editKey2.currentState!.validate()){
                                                      descModel.title=controllerTaskNameup2.text;
                                                      descModel.startTime=controllerTaskStartingTimeup2.text;
                                                      descModel.endTime=controllerTaskEndingTimeup2.text;
                                                      descModel.slot=controllerTaskSlotup2.text;
                                                      await Provider.of<DbProvider>(context, listen: false).updateTask2(descModel);
                                                      Navigator.pop(context);
                                                    }

                                                        }, icon: Icon(Icons.edit,color: KRedLight,)))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                },
                                child: Icon(Icons.edit,color: blue,size: 20,)),
                            SizedBox(width: 5,),
                            InkWell(
                                onTap: (){
                                  Provider.of<DbProvider>(context,listen: false).deleteTask2(descModel);
                                },
                                child: Icon(Icons.remove,color: Colors.red,)),
                          ],
                        ),
                      ],
                    ),
                  )
                ]
            )
            )
          ],
        )
    );
  }
}