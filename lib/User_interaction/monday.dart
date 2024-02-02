import 'package:flutter/material.dart';
import 'package:meal_plan/evaluation/evaluation.dart';

class ScreenMonday extends StatefulWidget {
  const ScreenMonday({Key? key}) : super(key: key);

  @override
  State<ScreenMonday> createState() => _ScreenMondayState();
}

class _ScreenMondayState extends State<ScreenMonday> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        title: Text('MONDAY'),
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
                        image: DecorationImage(image: AssetImage('images/monday1.jpg'),fit: BoxFit.cover)
                                  ),
                                     )),
                                Row(
                        children: [Text('Cut fruits+\n Moong dal dosa')],
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
                                  image: DecorationImage(image: AssetImage('images/MONDAY2.jpg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Stuffed Ivy gourd+\nVegetable salad+ \nBrinjal curry and\n Brown rice ')],
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
                                  image: DecorationImage(image: AssetImage('images/MONDAY3.jpg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Sprouted salad\n with Herbal tea')],
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
                                  image: DecorationImage(image: AssetImage('images/monday4.jpg'),fit: BoxFit.cover)),
                                     )),
                                Row(
                        children: [Text('Yam dosa with\n ginger curry')],
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