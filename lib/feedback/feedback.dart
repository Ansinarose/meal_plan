
import 'package:flutter/material.dart';
import 'package:meal_plan/Database_Connection/db_helper.dart';
import 'package:meal_plan/Database_Connection/db_modelClass.dart';
import 'package:intl/intl.dart';

class ScreenFeedback extends StatefulWidget {
  final Map<DateTime, List<String>> notes;

  const ScreenFeedback({Key? key, required this.notes}) : super(key: key);

  @override
  _ScreenFeedbackState createState() => _ScreenFeedbackState();
}

class _ScreenFeedbackState extends State<ScreenFeedback> {
  List<FeedbackModel> feedbackList = [];
  void initState() {
    super.initState();
    loadFeedbackData();
  }

  Future<void> loadFeedbackData() async {
      List<FeedbackModel> feedbackData = await DatabaseHelper.instance.getAllFeedback();
      setState(() {
        feedbackList = feedbackData;
      });
  }
  // Use widget.notes to access the notes data in this state
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: Text('My Feedbacks:',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            Expanded(child: ListView.builder(
              itemCount: feedbackList.length,
              itemBuilder: (context, index) {
      var feedbackDate = feedbackList[index].feedbackDate;
      var notes = feedbackList[index].notes;
      var feedbackId = feedbackList[index].id;
 
                return Card(
                  color: Color.fromARGB(255, 250, 226, 6),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                  title: Text(
         DateFormat('dd-MMM-yyyy').format(DateTime.parse(feedbackDate)),
        style: TextStyle(color: Colors.black,
         fontSize: 18,
         fontWeight: FontWeight.bold),
      ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top:15.0),
                      child: Text('$notes',style: TextStyle(color: Colors.black,
                      fontSize: 16),),
                      
                    ),
                    trailing: IconButton(onPressed: () {
                        deleteFeedback(feedbackId!);
                    }, icon:Icon(Icons.delete,
                    color: Colors.black)),
                  ),
                );},
              )),
          ],
         ),
         ),);
             }

  void deleteFeedback(int feedbackId) async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Are you sure you want to delete feeback?',
            style: TextStyle(fontSize: 15,
            color: Color.fromARGB(255, 250, 226, 6),), ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Cancel',style: TextStyle(color:Color.fromARGB(255, 250, 226, 6), ),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Delete',style: TextStyle(color: Color.fromARGB(255, 250, 226, 6),),),
            )
          ],
        );
      },
    );
    if (confirmDelete == true) {
      await DatabaseHelper.instance.deleteFeedback(feedbackId);
      loadFeedbackData();
    }
  }
}