import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:second_project/constants/colors.dart';
import 'package:second_project/data/data.dart';
import 'package:second_project/data/dbHelper.dart';
import 'package:second_project/data/dbProvider.dart';
import 'package:second_project/models/taskModel.dart';
import 'package:second_project/screens/homePage/home.dart';
import 'package:second_project/screens/homePage/percentIndicators.dart';
import 'package:second_project/screens/widget/taskTimeLine.dart';
import 'package:second_project/screens/widget/tasks.dart';
import 'package:second_project/screens/widget/textFormFieldWidget.dart';


class TaskInfo extends StatelessWidget {

  // final List<TaskModel>? myTask = tasks;
  DateTime _selecteddate=DateTime.now();
  DatePickerController? controller;
  TextEditingController controllerTaskName = TextEditingController();
  TextEditingController controllerTaskStartingTime = TextEditingController();
  TextEditingController controllerTaskEndingTime = TextEditingController();
  TextEditingController controllerTaskSlot = TextEditingController();

  GlobalKey<FormState> addKey = GlobalKey();

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


  @override
  Widget build(BuildContext context) {
    const RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0)));
    // final detailList = widget.taskModel.desc;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Personal Task',style :GoogleFonts.caveat(
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Image.asset('assets/images/task.jpg',fit: BoxFit.cover,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: KBlueDark.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text('Time Line',style:  GoogleFonts.caveat(
                                color:blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),),
                            ),
                            SizedBox(width: 200,),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: KBlueDark.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text('Tasks',style:
                              GoogleFonts.caveat(
                                color:blue,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Provider.of<DbProvider>(context).TaskList.length == 0?SliverFillRemaining(
            child: Container(
                color: Colors.white,
                child: Center(child: Lottie.asset('assets/animation/em.json'))),
          ):SliverList(delegate: SliverChildBuilderDelegate(
                  (context,index)=>TaskTimeLine(Provider.of<DbProvider>(context).TaskList[index],greenSet),
              childCount:  Provider.of<DbProvider>(context).TaskList.length
          )),
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
              BottomNavigationBarItem(icon: InkWell(
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
                              key: addKey,
                              child: Column(
                                children: [
                                  TextFormFieldWidget(title: 'Task Name :',controller:controllerTaskName,validator:requiredValidator ),
                                  SizedBox(height: 15,),
                                  TextFormFieldWidget(title: 'Starting Time :',controller:controllerTaskStartingTime,validator:clockValidation ),
                                  SizedBox(height: 15,),
                                  TextFormFieldWidget(title: 'Ending Time :',controller:controllerTaskEndingTime,validator: clockValidation),
                                  SizedBox(height: 15,),
                                  TextFormFieldWidget(title: 'slot :',controller:controllerTaskSlot,validator:slotValidation ),
                                  SizedBox(height: 15,),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: blue
                                      ),
                                      child: IconButton(
                                        // onPressed: () async {
                                        //   TaskModel taskModel = TaskModel(title: content);
                                        //   await Provider.of<DbProvider>(context, listen: false)
                                        //       .createNewTask(taskModel);
                                        //   Navigator.of(context).pop();
                                        // },
                                          onPressed: ()async{
                                             if (addKey.currentState!.validate()){

                                               DescModel descModel = DescModel(title: controllerTaskName.text, startTime: controllerTaskStartingTime.text, endTime: controllerTaskEndingTime.text, slot: controllerTaskSlot.text);
                                               await Provider.of<DbProvider>(context, listen: false).createNewTask(descModel);

                                               Navigator.pop(context);
                                             }

                                          }, icon: Icon(Icons.done_rounded,color: KRedLight,)))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  },
                  child: Icon(Icons.add,size: 30,)),label: 'Add'),

            ],
          ),
        ),
      ) ,
    );
  }
}


