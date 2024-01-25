
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:meal_plan/Database_Connection/db_helper.dart';
import 'package:meal_plan/Database_Connection/db_modelClass.dart';
import 'package:meal_plan/User_interaction/calender.dart';

class ScreenCarousel extends StatefulWidget {
  const ScreenCarousel({Key? key}) : super(key: key);

  @override
  ScreenCarouselState createState() => ScreenCarouselState();
}

class ScreenCarouselState extends State<ScreenCarousel> {
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    // Fetch images for all meal times of the current day
    fetchImagesForCurrentDay();
  }

  Future<void> fetchImagesForCurrentDay() async {
    DateTime now = DateTime.now();
    String currentDay = getDayString(now.weekday);

    // List of food times to fetch images for
    List<String> foodTimes = ['Breakfast', 'Lunch', 'Snack', 'Dinner'];

    List<MealModel> meals = [];
    for (String foodTime in foodTimes) {
      MealModel? meal = await databaseHelper.getMealForDayAndTime(currentDay, foodTime);
      if (meal != null) {
        meals.add(meal);
      }
    }

    setState(() {
      images = meals.map((meal) => meal.image).toList();
    });
  }

  String getDayString(int dayOfWeek) {
    List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[dayOfWeek - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 250, 226, 6),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Text('MENU FOR TODAY',
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'BlackOpsOne'),),
          ),
          SizedBox(height: 50,),
          Center(
            child: CarouselSlider(
              items: images.map((image) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(image)),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 500,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 1), 
                enlargeCenterPage: true,
                viewportFraction: 0.8,
              ),
            ),
          ),
            Padding(
            padding: const EdgeInsets.only(top:50.0),
            child: ElevatedButton(
              onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ScreenCalender()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:Color.fromARGB(255, 250, 226, 6) ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Adjust the radius as needed
                ),
              ),
             child: Text('Next',
            style: TextStyle(fontSize: 16,color: Colors.black
            ),)),
          )
        ],
      ),
    );
  }
}
