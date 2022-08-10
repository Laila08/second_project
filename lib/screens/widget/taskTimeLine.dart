import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:second_project/constants/colors.dart';
import 'package:second_project/data/data.dart';
import 'package:second_project/data/dbProvider.dart';
import 'package:second_project/models/taskModel.dart';
import 'package:second_project/screens/widget/textFormFieldWidget.dart';
import 'package:timeline_tile/timeline_tile.dart';


class TaskTimeLine extends StatelessWidget{
  DescModel descModel;
  List<Color> pageColor;
  TaskTimeLine(this.descModel,this.pageColor);
  TextEditingController controllerTaskNameup = TextEditingController();
  TextEditingController controllerTaskStartingTimeup = TextEditingController();
  TextEditingController controllerTaskEndingTimeup = TextEditingController();
  TextEditingController controllerTaskSlotup = TextEditingController();

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


  GlobalKey<FormState> editKey = GlobalKey();



  //final List<TaskModel>? myTask = tasks;

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
                  // Provider.of<DbProvider>(context).personalTasks.length!=0
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
                                            key: editKey,
                                            child: Column(
                                              children: [
                                                TextFormFieldWidget(title: 'New Task Name :',controller:controllerTaskNameup,validator: requiredValidator,),
                                                SizedBox(height: 15,),
                                                TextFormFieldWidget(title: 'New Starting Time :',controller:controllerTaskStartingTimeup,validator: slotValidation,),
                                                SizedBox(height: 15,),
                                                TextFormFieldWidget(title: 'New Ending Time :',controller:controllerTaskEndingTimeup,validator: slotValidation,),
                                                SizedBox(height: 15,),
                                                TextFormFieldWidget(title: 'slot :',controller:controllerTaskSlotup,validator: slotValidation,),
                                                SizedBox(height: 15,),
                                                Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(15),
                                                        color: blue
                                                    ),
                                                    child: IconButton(
                                                        onPressed: ()async{
                                                          if (editKey.currentState!.validate()){
                                                            descModel.title=controllerTaskNameup.text;
                                                            descModel.startTime=controllerTaskStartingTimeup.text;
                                                            descModel.endTime=controllerTaskEndingTimeup.text;
                                                            descModel.slot=controllerTaskSlotup.text;
                                                            await Provider.of<DbProvider>(context, listen: false).updateTask(descModel);
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
                                  Provider.of<DbProvider>(context,listen: false).deleteTask(descModel);
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