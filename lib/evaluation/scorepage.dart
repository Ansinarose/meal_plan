

import 'package:flutter/material.dart';
import 'package:meal_plan/database_Connection/db_helper.dart';
import 'package:meal_plan/user_Interaction/calender.dart';
import 'package:meal_plan/evaluation/evaluationModel.dart';
import 'package:intl/intl.dart'; // Import the date formatting package
class ScreenScore extends StatelessWidget {
  final String score;
  final List<EvaluationResult> results;
ScreenScore(this.score, this.results);
   @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        title: Text(
          'Score your Day',
          style: TextStyle(fontWeight: FontWeight.w500),),
          leading: IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenCalender()));
          }, icon: Icon(Icons.arrow_back
      ))
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var result in results)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color.fromARGB(255, 252, 232, 47),
                  child: ListTile(
                   title: Text('${_formatDate(result.date)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                     subtitle: Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Text(result.statement,
                      style: TextStyle(
                        fontWeight: FontWeight.w500
                      ),),
                     ),
                     trailing: Text((' ${result.score}'),style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                     ),),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
 String _formatDate(String dateString) {
  List<String> dateParts = dateString.split('-');
  if (dateParts.length == 3) {
    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);
    
    return DateFormat('dd-MMM-yyyy').format(DateTime(year, month, day));
  } else {
    return 'Invalid Date';
  }
}


}

