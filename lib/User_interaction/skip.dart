import 'package:flutter/material.dart';
import 'package:meal_plan/user_Interaction/carousalPage.dart';
import 'package:meal_plan/user_Interaction/userLogin.dart';

class ScreenSkip extends StatelessWidget {
  const ScreenSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/skip.jpg'),
          fit: BoxFit.cover)
        ),
        child: Column(
          // 
          children: [Padding(
            padding: const EdgeInsets.only(top:630.0,left: 220),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){return ScreenCarousel();}));
              },
              child: Text('Skip...',
              style: TextStyle(fontSize: 22),),
            ),
          )],
        ),
      ),
    );
  }
}