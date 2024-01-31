// // import 'package:flutter/material.dart';
// // import 'package:meal_plan/Admin%20side/add.dart';

// // class WeekCardsPage extends StatelessWidget {
// //   const WeekCardsPage({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Column(
// //             children: [
// //               for (var day in [
// //                 'Sunday',
// //                 'Monday',
// //                 'Tuesday',
// //                 'Wednesday',
// //                 'Thursday',
// //                 'Friday',
// //                 'Saturday'
// //               ])
// //                 DayCard(
// //                   day: day,
// //                   onTap: () {
// //                     // Navigate to a screen specific to the selected day
// //                     // Navigator.push(
// //                     //   context,
// //                     //   MaterialPageRoute(
// //                     //     builder: (context) => DayDetailsScreen(day: day),
// //                     //   ),
// //                     // );
// //                   },
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(
// //               context, MaterialPageRoute(builder: (context) => ScreenAdd()));
// //                       },
// //         backgroundColor: Colors.black,
// //         child: Icon(Icons.add,color: Color.fromARGB(255, 250, 226, 6),),
// //       ),
// //     );
// //   }
// // }

// // class DayCard extends StatelessWidget {
// //   final String day;
// //   final VoidCallback onTap;

// //   const DayCard({required this.day, required this.onTap});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Card(
// //         elevation: 3,
// //         margin: const EdgeInsets.symmetric(vertical: 8),
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Center(
// //             child: Text(
// //               day,
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
  
// // }

// // import 'package:flutter/material.dart';
// // import 'package:meal_plan/Admin%20side/add.dart';
// // import 'package:meal_plan/Database_Connection/db_helper.dart';
// // import 'package:meal_plan/Database_Connection/db_modelClass.dart';

// // class WeekCardsPage extends StatefulWidget {
// //   const WeekCardsPage({Key? key}) : super(key: key);

// //   @override
// //   _WeekCardsPageState createState() => _WeekCardsPageState();
// // }

// // class _WeekCardsPageState extends State<WeekCardsPage> {
// //   late Map<String, List<MealModel>> mealsByDay;

// //   @override
// //   void initState() {
// //     super.initState();
// //     mealsByDay = {
// //       'Sunday': [],
// //       'Monday': [],
// //       'Tuesday': [],
// //       'Wednesday': [],
// //       'Thursday': [],
// //       'Friday': [],
// //       'Saturday': [],
// //     };
// //     _fetchMeals();
// //   }

// //   Future<void> _fetchMeals() async {
// //     // Fetch meals and populate the mealsByDay map
// //     try {
// //       List<MealModel> fetchedMeals = await DatabaseHelper.instance.getAllMeals();
// //       for (var meal in fetchedMeals) {
// //         mealsByDay[meal.day]?.add(meal);
// //       }
// //       setState(() {});
// //     } catch (e) {
// //       print('Error fetching meals: $e');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Column(
// //             children: [
// //               for (var day in [
// //                 'Sunday',
// //                 'Monday',
// //                 'Tuesday',
// //                 'Wednesday',
// //                 'Thursday',
// //                 'Friday',
// //                 'Saturday'
// //               ])
// //                 DayCard(
// //                   day: day,
// //                   meals: mealsByDay[day] ?? [],
// //                   onTap: () {
// //                     // Navigate to a screen specific to the selected day
// //                     // Navigator.push(
// //                     //   context,
// //                     //   MaterialPageRoute(
// //                     //     builder: (context) => DayDetailsScreen(day: day),
// //                     //   ),
// //                     // );
// //                   },
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(
// //               context, MaterialPageRoute(builder: (context) => ScreenAdd()));
// //         },
// //         backgroundColor: Colors.black,
// //         child: Icon(Icons.add, color: Color.fromARGB(255, 250, 226, 6)),
// //       ),
// //     );
// //   }
// // }

// // class DayCard extends StatelessWidget {
// //   final String day;
// //   final List<MealModel> meals;
// //   final VoidCallback onTap;

// //   const DayCard({required this.day, required this.meals, required this.onTap});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Card(
// //         elevation: 3,
// //         margin: const EdgeInsets.symmetric(vertical: 8),
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             children: [
// //               Text(
// //                 day,
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               SizedBox(height: 10),
// //               for (var meal in meals)
// //                 ListTile(
// //                   title: Text(meal.foodtime),
// //                   subtitle: Text(meal.description),
                
// //                   // Add buttons for edit and delete here
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:meal_plan/Admin%20side/add.dart';
// import 'package:meal_plan/Admin%20side/edit.dart';
// import 'package:meal_plan/Database_Connection/db_modelClass.dart';
// import 'package:meal_plan/Database_Connection/db_helper.dart';

// class WeekCardsPage extends StatefulWidget {
//   const WeekCardsPage({Key? key}) : super(key: key);

//   @override
//   _WeekCardsPageState createState() => _WeekCardsPageState();
// }

// class _WeekCardsPageState extends State<WeekCardsPage> {
//   late Map<String, List<MealModel>> mealsByDay;

//   @override
//   void initState() {
//     super.initState();
//     mealsByDay = {
//       'Sunday': [],
//       'Monday': [],
//       'Tuesday': [],
//       'Wednesday': [],
//       'Thursday': [],
//       'Friday': [],
//       'Saturday': [],
//     };
//     _fetchMeals();
//   }

//   Future<void> _fetchMeals() async {
//     try {
//       List<MealModel> fetchedMeals = await DatabaseHelper.instance.getAllMeals();
//       for (var meal in fetchedMeals) {
//         mealsByDay[meal.day]?.add(meal);
//       }
//       setState(() {});
//     } catch (e) {
//       print('Error fetching meals: $e');
//     }
//   }
// Future<void> _deleteMeal(int mealId) async {
//   try {
//     await DatabaseHelper.instance.deleteMeal(mealId);
//     // Fetch meals again after deletion
//     _fetchMeals();
//   } catch (e) {
//     print('Error deleting meal: $e');
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               for (var day in [
//                 'Sunday',
//                 'Monday',
//                 'Tuesday',
//                 'Wednesday',
//                 'Thursday',
//                 'Friday',
//                 'Saturday'
//               ])
//                 DayCard(
//                   day: day,
//                   meals: mealsByDay[day] ?? [],
//                   onTap: () {
//                     // Navigate to a screen specific to the selected day
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => DayDetailsScreen(day: day),
//                     //   ),
//                     // );
//                   },
//                 ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => ScreenAdd()));
//         },
//         backgroundColor: Colors.black,
//         child: Icon(Icons.add, color: Color.fromARGB(255, 250, 226, 6)),
//       ),
//     );
//   }
// }

// class DayCard extends StatelessWidget {
//   final String day;
//   final List<MealModel> meals;
//   final VoidCallback onTap;

//   const DayCard({required this.day, required this.meals, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         elevation: 3,
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Text(
//                 day,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               for (var meal in meals)
//                 MealTile(
//                   meal: meal,
//                   onEdit: () {
//                     // Handle edit action
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ScreenEdit(meal: meal),
//                       ),
//                     );
//                   },
//                   onDelete: () {
//                     // Handle delete action
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           backgroundColor: Colors.black,
//                           title: Text(
//                             'Are you sure you want to delete?',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 250, 226, 6),
//                               fontSize: 15,
//                             ),
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop(false);
//                               },
//                               child: Text(
//                                 'Cancel',
//                                 style: TextStyle(
//                                   color: Color.fromARGB(255, 250, 226, 6),
//                                 ),
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 _deleteMeal(meal.id);
//                                 Navigator.of(context).pop(true);
//                               },
//                               child: Text(
//                                 'Delete',
//                                 style: TextStyle(
//                                   color: Color.fromARGB(26, 250, 226, 6),
//                                 ),
//                               ),
//                             )
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
 
 
// }

// class MealTile extends StatelessWidget {
//   final MealModel meal;
//   final VoidCallback onEdit;
//   final VoidCallback onDelete;

//   const MealTile({
//     required this.meal,
//     required this.onEdit,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Color.fromARGB(255, 252, 232, 47),
//       child: ListTile(
//         title: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             meal.foodtime,
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         subtitle: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(meal.description),
//         ),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               onPressed: onEdit,
//               icon: Icon(Icons.edit),
//             ),
//             IconButton(
//               onPressed: onDelete,
//               icon: Icon(Icons.delete),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ... Rest of the code remains unchanged ...
