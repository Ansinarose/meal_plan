import 'package:flutter/material.dart';
import 'package:meal_plan/User_interaction/carousalPage.dart';
import 'package:meal_plan/User_interaction/userLogin.dart';

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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [Padding(
            padding: const EdgeInsets.only(top:620.0,),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){return ScreenCarousel();}));
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:30.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(MaterialPageRoute(builder: (ctx){return ScreenHome();}));
                      },
                      child: Text('Back',
                      style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  SizedBox(width: 50),
                  Text('Skip...',
                  style: TextStyle(
                    fontSize: 18,
                  ),),
                ],
              ),
            ),
          )],
        ),
      ),
    );
  }
}