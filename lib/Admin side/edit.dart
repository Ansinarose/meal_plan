// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:meal_plan/Admin%20side/home.dart';

// class ScreenEdit extends StatefulWidget {
//   const ScreenEdit({super.key});

//   @override
//   State<ScreenEdit> createState() => _ScreenEditState();
// }

// class _ScreenEditState extends State<ScreenEdit> {
//    List<String> Days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
//   List<String> FoodTime = ['Breakfast', 'Lunch', 'Snack', 'Dinner'];

//   String selectedDay = 'Monday';
//   String selectedTime = 'Breakfast';

//   final TextEditingController descriptionController = TextEditingController();

//   File? _image;

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }

//   @override
//   void initState(){
//     super.initState();
//    selectedTime = FoodTime.first;  
//   }
  
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 250, 226, 6),
//       )  ,
//        body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             children: [
//               DropdownButtonFormField<String>(
//                 value: selectedDay,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedDay = newValue!;
//                   });
//                 },
//                 items: Days.map((String day) {
//                   return DropdownMenuItem<String>(
//                     value: day,
//                     child: Text(day),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   labelText: 'Day',
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
            
//               DropdownButtonFormField<String>(
//   value: selectedTime,
//   onChanged: (String? newvalue) {
//     setState(() {
//       selectedTime = newvalue!;
//       print('Selected Time: $selectedTime');
//     });
//   },
//   items: FoodTime.map((String foodtime) {
//     return DropdownMenuItem<String>(
//       value: foodtime,
//       child: Text(foodtime),
//     );
//   }).toList(),
//   decoration: InputDecoration(
//     labelText: 'Food Time',
//     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(20),
//       borderSide: BorderSide(color: Colors.black),
//     ),
//   ),
// ),

//               SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       backgroundColor: Color.fromARGB(255, 250, 226, 6),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       title: Row(
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 'Camera',
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                               IconButton(
//                                 onPressed: () {
//                                   _pickImage(ImageSource.camera);
//                                   Navigator.pop(context);
//                                 },
//                                 icon: Icon(Icons.camera_alt_outlined),
//                               )
//                             ],
//                           ),
//                           SizedBox(width: 100),
//                           Column(
//                             children: [
//                               Text(
//                                 'Gallery',
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                               IconButton(
//                                 onPressed: () {
//                                   _pickImage(ImageSource.gallery);
//                                   Navigator.pop(context);
//                                 },
//                                 icon: Icon(Icons.photo_outlined),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 250,
//                   width: 250,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: _image != null
//                         ? DecorationImage(
//                             image: FileImage(_image!),
//                             fit: BoxFit.cover,
//                           )
//                         : DecorationImage(
//                             image: AssetImage('images/plates.png'),
//                           ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
                
//                 controller: descriptionController,
//                 decoration: InputDecoration(
                  
//                   labelText: 'Description',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 250, 226, 6)),
//                 onPressed: () {
                
//                   print("Added to database successfully!");
//                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScreenAdHome()));
//                 },
//                 child: Text(
//                   'Edit Food',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:meal_plan/Admin%20side/home.dart';
// import 'package:meal_plan/Database_Connection/db_helper.dart';
// import 'package:meal_plan/Database_Connection/db_modelClass.dart';

// class ScreenEdit extends StatefulWidget {
//   final MealModel meal;
//   const ScreenEdit({required this.meal});

//   @override
//   State<ScreenEdit> createState() => _ScreenEditState();
// }

// class _ScreenEditState extends State<ScreenEdit> {
//    List<String> Days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
//   List<String> FoodTime = ['Breakfast', 'Lunch', 'Snack', 'Dinner'];

//   // String selectedDay = 'Monday';
//   // String selectedTime = 'Breakfast';

//   // final TextEditingController descriptionController = TextEditingController();
//   late String selectedDay;
//   late String selectedTime;
//   late TextEditingController descriptionController;
//   late String image;
//   File? _image;

  

//   @override
//   void initState(){
//     super.initState();
//     selectedDay = widget.meal.day;
//     selectedTime = widget.meal.foodtime;
//     image = widget.meal.image;
//     descriptionController = TextEditingController(text: widget.meal.description);
//    //selectedTime = FoodTime.first;  
//   }
//   Future<void> _pickImage(ImageSource source) async {
//     print('Picking image from: $source');
//     final pickedFile = await ImagePicker().pickImage(source: source);
//  print('Picked File: $pickedFile');
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//         image = pickedFile.path;
//           print('Image Path: $image');
//       }else {
//     print('Image selection canceled');
//   }
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//      print('Image File Exists: ${File(image).existsSync()}');
//     print('_image: $_image, image: $image');

//     return Scaffold(
//      appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 250, 226, 6),
//       )  ,
//        body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             children: [
//               DropdownButtonFormField<String>(
//                 value: selectedDay,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedDay = newValue!;
//                   });
//                 },
//                 items: Days.map((String day) {
//                   return DropdownMenuItem<String>(
//                     value: day,
//                     child: Text(day),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   labelText: 'Day',
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
            
//               DropdownButtonFormField<String>(
//   value: selectedTime,
//   onChanged: (String? newvalue) {
//     setState(() {
//       selectedTime = newvalue!;
//     });
//   },
//   items: FoodTime.map((String foodtime) {
//     return DropdownMenuItem<String>(
//       value: foodtime,
//       child: Text(foodtime),
//     );
//   }).toList(),
//   decoration: InputDecoration(
//     labelText: 'Food Time',
//     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(20),
//       borderSide: BorderSide(color: Colors.black),
//     ),
//   ),
// ),

//               SizedBox(height: 20),
              
//  GestureDetector(
//   onTap: () {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Color.fromARGB(255, 250, 226, 6),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         title: Row(
//           children: [
//             Column(
//               children: [
//                 Text(
//                   'Camera',
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     _pickImage(ImageSource.camera);
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.camera_alt_outlined),
//                 )
//               ],
//             ),
//             SizedBox(width: 100),
//             Column(
//               children: [
//                 Text(
//                   'Gallery',
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     _pickImage(ImageSource.gallery);
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.photo_outlined),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   },
//   child: Container(
//     height: 250,
//     width: 250,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//       color: Colors.grey, // Set a background color in case the image is null
//     ),
//     child: _image != null && File(image).existsSync()
//         ? Image.file(
//           //  File(image),
//           _image!,
//             fit: BoxFit.cover,
//           )
//         : Image.asset('images/plates.png', fit: BoxFit.cover),
//   ),
// ),

//               SizedBox(height: 20),
//               TextField(
                
//                 controller: descriptionController,
//                 decoration: InputDecoration(
                  
//                   labelText: 'Description',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 250, 226, 6)),
//                 onPressed: () {
//                  _editInDatabase();
//                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScreenAdHome()));
//                 },
//                 child: Text(
//                   'Edit Food',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//    void _editInDatabase() async {
//     final day = selectedDay;
//     final foodtime = selectedTime;
//     final image = _image != null ? _image!.path : '';
//     final description = descriptionController.text;

//     final editedMeal = MealModel(
//       id: widget.meal.id, // Pass the ID of the existing meal
//       day: day,
//       foodtime: foodtime,
//       image: image,
//       description: description,
//     );

//     await DatabaseHelper.instance.updateMeal(editedMeal);
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_plan/Admin%20side/home.dart';
import 'package:meal_plan/Database_Connection/db_helper.dart';
import 'package:meal_plan/Database_Connection/db_modelClass.dart';

class ScreenEdit extends StatefulWidget {
  final MealModel meal;
  const ScreenEdit({required this.meal});

  @override
  State<ScreenEdit> createState() => _ScreenEditState();
}

class _ScreenEditState extends State<ScreenEdit> {
   List<String> Days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  List<String> FoodTime = ['Breakfast', 'Lunch', 'Snack', 'Dinner'];

  // String selectedDay = 'Monday';
  // String selectedTime = 'Breakfast';

  // final TextEditingController descriptionController = TextEditingController();
  late String selectedDay;
  late String selectedTime;
  late TextEditingController descriptionController;
  late String image;
  File? _image;

  

  @override
  void initState(){
    super.initState();
    selectedDay = widget.meal.day;
    selectedTime = widget.meal.foodtime;
    image = widget.meal.image;
    descriptionController = TextEditingController(text: widget.meal.description);
   //selectedTime = FoodTime.first;  
  }
  Future<void> _pickImage(ImageSource source) async {
    print('Picking image from: $source');
    final pickedFile = await ImagePicker().pickImage(source: source);
 print('Picked File: $pickedFile');
 if (pickedFile != null) {
    setState(() {
      
        _image = File(pickedFile.path);
        image = pickedFile.path;
          print('Image Path: $image');
      });
      }else {
    print('No image picked');
  }
    }
  
  @override
  Widget build(BuildContext context) {
     print('Image File Exists: ${File(image).existsSync()}');
    print('_image: $_image, image: $image');

    return Scaffold(
     appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
      )  ,
       body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedDay,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDay = newValue!;
                  });
                },
                items: Days.map((String day) {
                  return DropdownMenuItem<String>(
                    value: day,
                    child: Text(day),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Day',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
            
              DropdownButtonFormField<String>(
  value: selectedTime,
  onChanged: (String? newvalue) {
    setState(() {
      selectedTime = newvalue!;
    });
  },
  items: FoodTime.map((String foodtime) {
    return DropdownMenuItem<String>(
      value: foodtime,
      child: Text(foodtime),
    );
  }).toList(),
  decoration: InputDecoration(
    labelText: 'Food Time',
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.black),
    ),
  ),
),

              SizedBox(height: 20),
              
 GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Column(
              children: [
                Text(
                  'Camera',
                  style: TextStyle(fontSize: 15),
                ),
                IconButton(
                  onPressed: () {
                    _pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.camera_alt_outlined),
                )
              ],
            ),
            SizedBox(width: 100),
            Column(
              children: [
                Text(
                  'Gallery',
                  style: TextStyle(fontSize: 15),
                ),
                IconButton(
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.photo_outlined),
                )
              ],
            ),
          ],
        ),
      ),
    );
  },
  child: Container(
    height: 250,
    width: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey, // Set a background color in case the image is null
    ),
    //child: _image != null && File(image).existsSync()
     child: image.isNotEmpty
        ? Image.file(
           File(image),
        //  _image!,
            fit: BoxFit.cover,
          )
        : Image.asset('images/plates.png', fit: BoxFit.cover),
  ),
),

              SizedBox(height: 20),
              TextField(
                
                controller: descriptionController,
                decoration: InputDecoration(
                  
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 250, 226, 6)),
                onPressed: () {
                 _editInDatabase();
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScreenAdHome()));
                },
                child: Text(
                  'Edit Food',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
   void _editInDatabase() async {
    final day = selectedDay;
    final foodtime = selectedTime;
    final image = _image != null ? _image!.path : '';
    final description = descriptionController.text;

    final editedMeal = MealModel(
      id: widget.meal.id, // Pass the ID of the existing meal
      day: day,
      foodtime: foodtime,
      image: image,
      description: description,
    );

    await DatabaseHelper.instance.updateMeal(editedMeal);
  }
}