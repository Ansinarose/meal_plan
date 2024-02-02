import 'package:flutter/material.dart';
import 'package:meal_plan/user_Interaction/monday.dart';
import 'package:meal_plan/user_Interaction/saturday.dart';
import 'package:meal_plan/user_Interaction/sunday.dart';
import 'package:meal_plan/user_Interaction/thursday.dart';
import 'package:meal_plan/user_Interaction/tuesday.dart';
import 'package:meal_plan/user_Interaction/userMenu.dart';
import 'package:meal_plan/user_Interaction/wednesday.dart';
import 'friday.dart';
class ScreenWeek extends StatelessWidget {
  const ScreenWeek({Key? key}) : super(key: key);
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        title: Text(
          '7DAYS   7PLANS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/about.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Choose the day and go for Meals',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                buildDayButton(
                  context,
                  'MONDAY     ',
                  'Option1',
                  'Option1Page',
                  'Option2',
                  'Option2PageMonday',
                  () => navigateToScreen(context, ScreenUserMenu(day: 'Monday')),
                  () => navigateToScreen(context, ScreenMonday()),
                ),
                buildDayButton(
                  context,
                  'TUESDAY      ',
                  'Option1',
                  'Option1Page', 
                  'Option2',
                  'Option2PageTuesday', 
                  () => navigateToScreen(context, ScreenUserMenu(day: 'Tuesday')),
                  () => navigateToScreen(context, ScreenTuesday()),
                ),
                 buildDayButton(
                  context,
                  'WEDNESDAY',
                  'Option1',
                  'Option1Page',
                  'Option2',
                  'Option2PageTuesday', 
                  () => navigateToScreen(context, ScreenUserMenu(day: 'Wednesday')),
                  () => navigateToScreen(context, ScreenWednesday()),
                ),
                 buildDayButton(
                  context,
                  'THURSDAY   ',
                  'Option1',
                  'Option1Page',
                  'Option2',
                  'Option2PageTuesday', 
                  () => navigateToScreen(context, ScreenUserMenu(day: 'Thursday')),
                  () => navigateToScreen(context, ScreenThursday()),
                ),
                 buildDayButton(
                  context,
                  'FRIDAY         ',
                  'Option1',
                  'Option1Page', 
                  'Option2',
                  'Option2PageTuesday', 
                  () => navigateToScreen(context, ScreenUserMenu(day: 'Friday')),
                  () => navigateToScreen(context, ScreenFriday()),
                ),
                 buildDayButton(
                  context,
                  'SATURDAY  ',
                  'Option1',
                  'Option1Page',
                  'Option2',
                  'Option2PageTuesday', 
                  () => navigateToScreen(context, ScreenUserMenu(day: 'Saturday')),
                  () => navigateToScreen(context, ScreenSaturday())
                ),
                 buildDayButton(
                  context,
                  'SUNDAY      ',
                  'Option1',
                  'Option1Page',
                  'Option2',
                  'Option2PageTuesday',
                  () => navigateToScreen(context, ScreenUserMenu(day: 'Sunday')),
                  () => navigateToScreen(context, ScreenSunday())
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 Widget buildDayButton(
    BuildContext context,
    String day,
    String option1Text,
    String option1PageRoute,
    String option2Text,
    String option2PageRoute,
    VoidCallback onOption1Pressed,
    VoidCallback onOption2Pressed,
  ) {
    return Column(
      children: [
        SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                day,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ),
            OutlinedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 250, 226, 6),)),
              onPressed: onOption1Pressed,
              child: Text(option1Text,style: TextStyle(color: Colors.black),),
            ),
            OutlinedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 250, 226, 6),)),
              onPressed: onOption2Pressed,
              child: Text(option2Text,style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ],
    );
  }
void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => screen));
  }
}

