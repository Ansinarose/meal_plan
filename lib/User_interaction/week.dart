import 'package:flutter/material.dart';
import 'package:meal_plan/user_Interaction/userMenu.dart';

class ScreenWeek extends StatelessWidget {
  const ScreenWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        title: Text('7DAYS   7PLANS',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildDayButton(context, 'MONDAY', () => navigateToScreen(context, ScreenUserMenu(day: 'Monday'))),
              buildDayButton(context, 'TUESDAY', () => navigateToScreen(context, ScreenUserMenu(day: 'Tuesday'))),
              buildDayButton(context, 'WEDNESDAY', () => navigateToScreen(context, ScreenUserMenu(day: 'Wednesday'))),
              buildDayButton(context, 'THURSDAY', () => navigateToScreen(context, ScreenUserMenu(day: 'Thursday'))),
              buildDayButton(context, 'FRIDAY', () => navigateToScreen(context, ScreenUserMenu(day: 'Friday'))),
              buildDayButton(context, 'SATURDAY', () => navigateToScreen(context, ScreenUserMenu(day: 'Saturday'))),
              buildDayButton(context, 'SUNDAY', () => navigateToScreen(context, ScreenUserMenu(day: 'Sunday'))),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDayButton(BuildContext context, String day, VoidCallback onPressed) {
    return Column(
      children: [
        SizedBox(height: 25),
        TextButton(
          onPressed: onPressed,
          child: Text(
            day,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
      ],
    );
  }

  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => screen));
  }
}
