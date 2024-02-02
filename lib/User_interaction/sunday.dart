import 'package:flutter/material.dart';
import 'package:meal_plan/evaluation/evaluation.dart';

class ScreenSunday extends StatefulWidget {
  const ScreenSunday({Key? key}) : super(key: key);

  @override
  State<ScreenSunday> createState() => _ScreenSundayState();
}

class _ScreenSundayState extends State<ScreenSunday> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        title: Text('SUNDAY'),
        centerTitle: true,
      ),
      
      body: ListView(
        children: [Column(
          children: [SizedBox(height: 10,),
            Text('Breakfast',
          style: TextStyle(fontSize: 22,
          fontWeight: FontWeight.w500),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Card(
                    elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                       color: Colors.white,
                    ),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(width: 200,height: 200,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage('images/sun1.jpeg'))
                                  ),
                                     )),
                                Row(
                        children: [Text('Cut fruits+\n Raggi idiyappam and\n Peanut chutney')],
                      )
                    ]), ),
                 ),
              ),
            ),
            Text('Lunch',style: TextStyle(fontSize: 22,
          fontWeight: FontWeight.w500),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Card(
                    elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                       color: Colors.white,
                    ),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(width: 200,height: 200,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(image: AssetImage('images/sun2.jpeg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Green salad +\nPea Curry\nJowar roti')],
                      )
                    ]), ),
                 ),
              ),
            ),
             Text('Snack',style: TextStyle(fontSize: 22,
          fontWeight: FontWeight.w500),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Card(
                    elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                       color: Colors.white,
                    ),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(width: 200,height: 200,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(image: AssetImage('images/sun3.jpg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Oats meal with\nCut fruits')],
                      )
                    ]), ),
                 ),
              ),
            ),
            Text('Dinner',style: TextStyle(fontSize: 22,
          fontWeight: FontWeight.w500),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Card(
                    elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                       color: Colors.white,
                    ),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(width: 200,height: 200,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(image: AssetImage('images/sun4.jpeg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Two boiled eggs')],
                      )
                    ]), ),
                 ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return ScreenEvaluation();}));
              }, 
               style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 250, 226, 6)),
              child: Text('EVALUATE',
              style: TextStyle(color: Colors.black),)),
            )
          ],
            
      
        )
        ],
      ),
);
}
}