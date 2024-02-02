import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:meal_plan/database_Connection/db_helper.dart';
import 'package:meal_plan/database_Connection/db_modelClass.dart';
import 'package:meal_plan/user_Interaction/calender.dart';

class ScreenCarousel extends StatefulWidget {
  const ScreenCarousel({Key? key}) : super(key: key);

  @override
  ScreenCarouselState createState() => ScreenCarouselState();
}

class ScreenCarouselState extends State<ScreenCarousel> {
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;
  List<String> images = [];
  List<String> staticimages = [
    'images/monday1.jpg',
    'images/tuesday1.jpg',
    'images/wed1.jpg',
    'images/thurs1.jpeg',
    'images/fri1.webp',
    'images/sat1.JPG',
    'images/sun1.jpeg', ];
  @override
  void initState() {
    super.initState();
    fetchImagesForCurrentDay();
  }
Future<void> fetchImagesForCurrentDay() async {
    DateTime now = DateTime.now();
    String currentDay = getDayString(now.weekday);
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
         //leading: Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text('MENU FOR TODAY',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'BlackOpsOne'),),
            ),
            SizedBox(height: 20,),
            Center(
              child: Column(
                children: [
                   CarouselSlider(
                items: staticimages.map((image) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
              ),
               SizedBox(height: 10,),
               CarouselSlider(
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
                      height: 300,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 1), 
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                    ),
                  ),
                 ],
          ),
        ),Padding(
              padding: const EdgeInsets.only(top:25.0),
              child: ElevatedButton(
                onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ScreenCalender()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:Color.fromARGB(255, 250, 226, 6) ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
               child: Text('Next',
              style: TextStyle(fontSize: 16,color: Colors.black
              ),)),
            )
          ],
        ),
      ),
    );
  }
}
