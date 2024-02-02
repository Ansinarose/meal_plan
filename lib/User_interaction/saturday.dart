import 'package:flutter/material.dart';
import 'package:meal_plan/evaluation/evaluation.dart';

class ScreenSaturday extends StatefulWidget {
  const ScreenSaturday({Key? key}) : super(key: key);

  @override
  State<ScreenSaturday> createState() => _ScreenSaturdayState();
}

class _ScreenSaturdayState extends State<ScreenSaturday> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        title: Text('SATURDAY'),
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
                                  image: DecorationImage(image: AssetImage('images/sat1.JPG'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Raggi dosa and\nChicken curry')],
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
                                  image: DecorationImage(image: AssetImage('images/sat2.jpg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Brown rice +\nVegetable thoran\nCut fruits')],
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
                                  image: DecorationImage(image: AssetImage('images/sat3.jpeg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Small portion of\nAlmonds')],
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
                                  image: DecorationImage(image: AssetImage('images/sat4.jpeg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Wheat Chapathi and\nChicken curry')],
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