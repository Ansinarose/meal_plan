import 'package:flutter/material.dart';
import 'package:meal_plan/evaluation/evaluation.dart';

class ScreenWednesday extends StatefulWidget {
  const ScreenWednesday({Key? key}) : super(key: key);

  @override
  State<ScreenWednesday> createState() => _ScreenWednesdayState();
}

class _ScreenWednesdayState extends State<ScreenWednesday> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        title: Text('WEDNESDAY'),
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
                                  image: DecorationImage(image: AssetImage('images/wed1.jpg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('A cup of fruits+\nMillet idli with\nSambar')],
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
                                  image: DecorationImage(image: AssetImage('images/wed2.jpeg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Vegetable salad +\nChapathi and\nChicken curry')],
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
                                  image: DecorationImage(image: AssetImage('images/wed3.jpg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Roasted chick peas')],
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
                                  image: DecorationImage(image: AssetImage('images/wed4.jpg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Cream of mushroom\nand cauliflower soup')],
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