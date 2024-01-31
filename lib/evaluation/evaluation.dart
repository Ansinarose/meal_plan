import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal_plan/database_Connection/db_helper.dart';
import 'package:meal_plan/evaluation/evaluationModel.dart';
import 'package:meal_plan/evaluation/scorepage.dart';

class ScreenEvaluation extends StatefulWidget {
const ScreenEvaluation({super.key});
 @override
  State<ScreenEvaluation> createState() => _ScreenEvaluationState();
                                          }
  class _ScreenEvaluationState extends State<ScreenEvaluation> {
    List<EvaluationModel> features = [
    EvaluationModel('1.', 'Today i woke up early in the morning(before 5:30)', false),
    EvaluationModel('2.', 'Today i followed up the given food routines correctly', false),
    EvaluationModel('3.', 'Today i did not add any foods other than the given items', false),
    EvaluationModel('4.', 'Today i drank 2L of water', false),
    EvaluationModel('5.', 'Today i practiced mindful eating', false),
    EvaluationModel('6.', 'Today i spent 30 minutes for workout', false),
    EvaluationModel('7.', 'Today i reduced sitting time and screen time', false),
    EvaluationModel('8.', 'Today i found ways to manage my stress', false),
    EvaluationModel('9.', 'Today i took Multi vitamin supplements as needed', false),
    EvaluationModel('10.', 'Today i maintained to sleep for almost 7 hours', false),
  ];
  List<EvaluationModel> selectedFeatures = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluate Today'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 244, 219, 2),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: features.length,
                  itemBuilder: (BuildContext context, int index) {
                    return EvaluationItem(
                      features[index].number,
                      features[index].evaluationkey,
                      features[index].isSelected,
                      index,);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    String statement = calculateMark(selectedFeatures.length);
                    String score = scores(selectedFeatures.length);
                    // ignore: unused_local_variable
                    String currentDate = _getCurrentDate();
                    await saveToDatabase(statement,score);
                    List<EvaluationResult> results = await displayFromDatabase();
                     Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return ScreenScore(statement, results);
                        },
                      ),
                    );
                  },
                  child: Text(
                    'ADD(${selectedFeatures.length})',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 244, 219, 2), ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
Widget EvaluationItem(String number, String evaluationkey, bool isSelected, int index) {
    return ListTile(
      leading: Text(number),
      title: Text(evaluationkey),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: Colors.yellow[700],)
          : Icon(Icons.check_circle_outline_outlined, color: Colors.grey,),
      onTap: () {
          setState(() {
          features[index].isSelected = !features[index].isSelected;
          if (features[index].isSelected == true) {
            selectedFeatures.add(EvaluationModel(number, evaluationkey, true));
          } else if (features[index].isSelected == false) {
            selectedFeatures
                .removeWhere((element) => element.evaluationkey == features[index].evaluationkey);
          }
        });
      },
    );
  }
String calculateMark(int selectedCount) {
    if (selectedCount == 10) {
      return 'CONGRATULATIONS! YOU ARE A HEALTH CHAMPION! 🎉';
    } else if (selectedCount == 9) {
      return 'You are doing exceptionally well! Keep up the good work!';
    } else if (selectedCount == 8) {
      return 'Great job! Your commitment to a healthy lifestyle is commendable.';
    } else if(selectedCount == 7){
      return 'You are on the right track! Continue making positive choices.';
    }else if(selectedCount == 6){
      return 'You are making progress! Keep focusing on your health goals.';
    }else if(selectedCount == 5){
      return 'You are on the path to improvement. Stay consistent!';
    }else if(selectedCount == 4){
      return 'There is room for improvement. Identify areas for positive changes.';
    }else if(selectedCount == 3){
      return 'Your performance needs attention. Make conscious choices for better health.';
    } else if(selectedCount == 2){
      return 'Considerable improvements are required. Take steps towards a healthier lifestyle.';
    }  else {
      return 'Significant changes are needed for better health. Start making positive choices.\n';
    }
  }
String scores(int selectedCount){
  if(selectedCount <= 10){
    return 'SCORE=${selectedFeatures.length}';
                         }
  else{
    return 'no mark';
  }}
Future<void> saveToDatabase(String statement, String score) async {
  DateTime currentDate = DateTime.now();
  DatabaseHelper.instance.database;

  // Format the current date as dd-mm-yyyy
  String formattedDate = DateFormat('dd-MM-yyyy').format(currentDate);

  // Check if the user has already submitted an evaluation for today
  List<EvaluationResult> existingResults = await DatabaseHelper.instance.getAllEvaluationResults();
  if (existingResults.any((result) => result.date == formattedDate)) {
    // User has already submitted an evaluation today, you can show a message or handle it accordingly
     ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('You have already submitted an evaluation for today.',
      style: TextStyle(color: Colors.black),),
      backgroundColor: Color.fromARGB(255, 244, 219, 2),
      duration: Duration(seconds: 3), // Adjust the duration as needed
    ),
  );
  } else {
    // User hasn't submitted an evaluation today, proceed to save
    await DatabaseHelper.instance.insertEvaluationResult(statement, score, formattedDate);
  }
}
String _getCurrentDate() {
  DateTime now = DateTime.now();
  String formattedDate = "${now.day}-${now.month}-${now.year}";
  return formattedDate;
}
Future<List<EvaluationResult>> displayFromDatabase() async {
    // Retrieve all evaluation results from the database
    List<EvaluationResult> results = await DatabaseHelper.instance.getAllEvaluationResults();
    return results;
  }
}
