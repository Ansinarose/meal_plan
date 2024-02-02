import 'package:flutter/material.dart';
import 'package:meal_plan/evaluation/evaluation.dart';

class ScreenTuesday extends StatefulWidget {
  const ScreenTuesday({Key? key}) : super(key: key);

  @override
  State<ScreenTuesday> createState() => _ScreenTuesdayState();
}

class _ScreenTuesdayState extends State<ScreenTuesday> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        title: Text('TUESDAY'),
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
                                  image: DecorationImage(image: AssetImage('images/tuesday1.jpg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('A cup of fruits+\nRava idli with\nCoriander and tomato\nChutney.')],
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
                                  image: DecorationImage(image: AssetImage('images/tuesday2.jpg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Vegetable salad +\nWheat Parota and\nParippu curry')],
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
                                  image: DecorationImage(image: AssetImage('images/tuesday3.jpg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Tender Coconut\nWater')],
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
                                  image: DecorationImage(image: AssetImage('images/tuesday4.jpeg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Chapathi with\nmashed spinach\n curry')],
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