import 'package:flutter/material.dart';
import 'package:meal_plan/admin_Side/adminlogin.dart';
import 'package:meal_plan/database_Connection/db_helper.dart';
import 'package:meal_plan/database_Connection/db_modelClass.dart';
import 'package:meal_plan/Hive_Database/recipe.dart';
import 'package:meal_plan/user_Interaction/about.dart';
import 'package:meal_plan/user_Interaction/carousalPage.dart';
import 'package:meal_plan/user_Interaction/privacyPolicy.dart';
import 'package:meal_plan/user_Interaction/week.dart';
import 'package:meal_plan/evaluation/evaluation.dart';
import 'package:meal_plan/feedback/feedback.dart';
import 'package:table_calendar/table_calendar.dart';
class ScreenCalender extends StatefulWidget {
  const ScreenCalender({super.key});
 @override
  State<ScreenCalender> createState() => _screencalenderState();
                     }
class _screencalenderState extends State<ScreenCalender> {
  DateTime today = DateTime.now();
  Map<DateTime, List<String>> notes = {};
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });}
@override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 226, 6),
        leading: IconButton(onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ScreenCarousel()));
       }, icon: Icon( Icons.arrow_back)),
        actions: [IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenRecipe()));
        }, icon: Tooltip(
          message: 'Add recipe',
          child: Icon(Icons.add),)),
        Padding(
          padding: const EdgeInsets.only(left:10.0),
          child: PopupMenuButton(
            itemBuilder: (context) => [
             PopupMenuItem(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ScreenFeedback(notes: notes)));
                      },
                      child: Text('Feedback',
                      style: TextStyle(color: Colors.black),)),),
                ],  )
                 ),
              PopupMenuItem(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ScreenEvaluation()));
                      },
                      child: Text('Evaluation',
                      style: TextStyle(color: Colors.black),)),),
                ],  )
              ),
              PopupMenuItem(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: TextButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return Screen_about();}));
                    },
                       child: Text('About',
                      style: TextStyle(color: Colors.black),)), ),
                ], )
              ),
               PopupMenuItem(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: TextButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return ScreenPrivacyPolicy();}));
                    },
                      child: Text('Privacy Policy',
                      style: TextStyle(color: Colors.black),)),),
            ])
              ),
               PopupMenuItem(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: TextButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return ScreenAdminLogin();}));
                    },
                      child: Text('Admin Use',
                      style: TextStyle(color: Colors.black),)), ),
                ],  )
              ),],
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.more_vert),),
        ),
        )],
      ),
      body: content(),
    );
  }
 Widget content() {
    return Column(
      children: [
        Container(
          child: TableCalendar(
            calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
            color: Color.fromARGB(255, 250, 226, 6),
             shape: BoxShape.circle),
             todayDecoration: BoxDecoration(
               color: Colors.black,
              shape: BoxShape.circle),
              selectedTextStyle: TextStyle(color: Colors.black), 
                  ),
              headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
                  ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 1, 1),
            onDaySelected: _onDaySelected,
          ),
          ),
        SizedBox(height: 20),
        TextButton(
          onPressed: () {
            _showNoteDialog(context);
          },
          child: Text('Open Feedback',
          style: TextStyle(color: Colors.black),),
        ),
        Padding(
  padding: const EdgeInsets.only(top: 40.0),
  child: OutlinedButton(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return ScreenWeek();
      }));
    },
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      side: BorderSide(color: Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
      ),
      backgroundColor: Color.fromARGB(255, 250, 226, 6),
    ),
    child: Text(
      'Let\'s start...',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)

      ],
      ); }
  void _showNoteDialog(BuildContext context) {
  TextEditingController noteController = TextEditingController();
 showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Feedback'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: noteController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'How was your day?...',
                ),),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel',
                    style: TextStyle(color: Colors.black),)
                  ),
                  TextButton(
                    onPressed: () async {
                       if (noteController.text.isNotEmpty){
                       await DatabaseHelper.instance.insertFeedback(
                        today.toLocal().toString(),
                        [noteController.text],  
                      );
                      setState(() {
                        notes[today] ??= [];
                        notes[today]?.add(noteController.text);
                      });
                       }
                      Navigator.of(context).pop(); },
                    child: Text('Save',
                    style: TextStyle(color: Colors.black),),),],
              ),
            ],
          ),
        ),
      );
    },
  );
}}
