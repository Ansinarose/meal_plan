import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meal_plan/evaluation/evaluation.dart';
import 'package:meal_plan/database_Connection/db_helper.dart';
import 'package:meal_plan/database_Connection/db_modelClass.dart';

class ScreenUserMenu extends StatefulWidget {
  final String day;

  const ScreenUserMenu({Key? key, required this.day}) : super(key: key);

  @override
  State<ScreenUserMenu> createState() => _ScreenUserMenuState();
}

class _ScreenUserMenuState extends State<ScreenUserMenu> {
  final dbHelper = DatabaseHelper.instance;

  MealModel? breakfastMeal;
  MealModel? lunchMeal;
  MealModel? snackMeal;
  MealModel? dinnerMeal;

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  void fetchMeals() async {
    breakfastMeal = await dbHelper.getMealForDayAndTime(widget.day, 'Breakfast');
    lunchMeal = await dbHelper.getMealForDayAndTime(widget.day, 'Lunch');
    snackMeal = await dbHelper.getMealForDayAndTime(widget.day, 'Snack');
    dinnerMeal = await dbHelper.getMealForDayAndTime(widget.day, 'Dinner');

    setState(() {}); // Trigger a rebuild with the fetched data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        title: Text(widget.day),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          buildMealCard('Breakfast', breakfastMeal),
          buildMealCard('Lunch', lunchMeal),
          buildMealCard('Snack', snackMeal),
          buildMealCard('Dinner', dinnerMeal),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return ScreenEvaluation();
                }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 250, 226, 6),
              ),
              child: Text(
                'EVALUATE',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMealCard(String mealTime, MealModel? meal) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          mealTime,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: meal?.image.isNotEmpty == true
                              ? DecorationImage(
                                  image: FileImage(File(meal!.image)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(meal?.description ?? ''),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
