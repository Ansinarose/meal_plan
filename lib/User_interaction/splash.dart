import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meal_plan/User_interaction/skip.dart';
import 'package:meal_plan/User_interaction/userLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => screensplashState();
}

class screensplashState extends State<ScreenSplash> {
  static const String KEYLOGIN = "Login";
  
    @override
  void initState() {
   super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/coverpage.jpg'),
          fit: BoxFit.cover)
          
        ),
       child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Padding(
          padding: EdgeInsets.only(top:100.0,left: 35),
          child: Text('WELCOME...',
          style: TextStyle(fontSize: 24),),
        )],
       ),
      ),
      
    );
  }
 
void whereToGo() async {
  var sharedpref = await SharedPreferences.getInstance();
  var isLoggedIn = sharedpref.getBool(screensplashState.KEYLOGIN);
  // Check if user details are already present in SharedPreferences
  var name = sharedpref.getString('name');
  var age = sharedpref.getString('age');
  var height = sharedpref.getString('height');
  var weight = sharedpref.getString('weight');

  Timer(Duration(seconds: 3), () {
    if (isLoggedIn != null && isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => ScreenSkip()));
    } else if (name != null && age != null && height != null && weight != null) {
      // User details are already present, navigate to skip page
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => ScreenSkip()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => ScreenHome()));
    }
  });
}
}

