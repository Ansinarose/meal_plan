import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meal_plan/Admin%20side/add.dart';
import 'package:meal_plan/Admin%20side/adminlogin.dart';
import 'package:meal_plan/Admin%20side/edit.dart';
import 'package:meal_plan/Database_Connection/db_helper.dart';
import 'package:meal_plan/Database_Connection/db_modelClass.dart';
import 'package:meal_plan/User_interaction/calender.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenAdHome extends StatefulWidget {
  const ScreenAdHome({Key? key}) : super(key: key);

  @override
  State<ScreenAdHome> createState() => _ScreenAdHomeState();
}

class _ScreenAdHomeState extends State<ScreenAdHome> {
  late Map<String, List<MealModel>> mealsByDay;
  List<MealModel> meals = [];

  @override
  void initState() {
    super.initState();
     mealsByDay = {}; 
    _fetchMeals();
  }

  Widget build(BuildContext context) {
    print('Building ScreenAdHome');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 226, 6),
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.black,
                  title: Text(
                    'Are you sure you want to Signout',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 250, 226, 6),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Color.fromARGB(255, 250, 226, 6)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        signout(context);
                      },
                      child: Text(
                        'Signout',
                        style: TextStyle(color: Color.fromARGB(255, 250, 226, 6)),
                      ),
                    )
                  ],
                );
              },
            );
          },
          icon: Icon(Icons.logout),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Add your Menu here',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
            for (var day in [
              'Monday',
              'Tuesday',
              'Wednesday',
              'Thursday',
              'Friday',
              'Saturday',
              'Sunday'
            ])
              DayCard(
                day: day,
                meals: mealsByDay[day] ?? [],
                onDeleteMeal: _deleteMeal,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ScreenAdd()));
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Color.fromARGB(255, 250, 226, 6)),
      ),
    );
  }

  Future<void> _fetchMeals() async {
      List<MealModel> fetchedMeals =
          await DatabaseHelper.instance.getAllMeals();
                mealsByDay = {};
for (var meal in fetchedMeals) {
        if (!mealsByDay.containsKey(meal.day)) {
          mealsByDay[meal.day] = [];
        } mealsByDay[meal.day]?.add(meal);
      }
       setState(() {
        meals = fetchedMeals;
      });}
void _deleteMeal(int mealId) async {
      await DatabaseHelper.instance.deleteMeal(mealId);
      _fetchMeals();
                  }
 void signout(BuildContext ctx) async {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const ScreenCalender(),
      ),
    );
  }
}
class DayCard extends StatelessWidget {
  final String day;
  final List<MealModel> meals;
  final Function(int) onDeleteMeal;
  const DayCard({
    required this.day,
    required this.meals,
    required this.onDeleteMeal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black45,
      elevation: 8,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            for (var meal in meals)
              MealTile(
                meal: meal,
                onEdit: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenEdit(meal: meal),
                    ),
                  );
                },
                onDelete: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          'Are you sure you want to delete?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 250, 226, 6),
                            fontSize: 15, ) ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Color.fromARGB(255, 250, 226, 6),
                              ),
                            ),),
                          TextButton(
                            onPressed: () {
                              onDeleteMeal(meal.id!); // Use meal.id!
                              Navigator.of(context).pop(true);
                            },
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                color: Color.fromARGB(255, 250, 226, 6),
                              ),), ) ],
                      );
                    },
                  );
                }, ),
          ],
        ),),
    );
  }}
class MealTile extends StatelessWidget {
  final MealModel meal;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
const MealTile({
    required this.meal,
    required this.onEdit,
    required this.onDelete,
  });
 @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 252, 232, 47),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            meal.foodtime,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onEdit,
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
